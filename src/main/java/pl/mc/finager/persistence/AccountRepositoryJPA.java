package pl.mc.finager.persistence;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Currency;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pl.mc.finager.model.fo.AccountFO;
import pl.mc.finager.model.vo.AccountVO;
import pl.mc.finager.persistence.po.AccountPO;

/**
 * JPA repository performing queries associated with Account entities.
 * @author mc
 */
@Repository
public class AccountRepositoryJPA implements AccountRepository {

	private static final Logger logger = LoggerFactory.getLogger(UserRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;

	@Override
	@Transactional
	public void addNewAccount(final AccountFO account, final long userID) {
		logger.info("Method addNewAccount invoked");
		AccountPO accountPO = new AccountPO();
		accountPO.setUserID(userID);
		accountPO.setType(account.getType());
		accountPO.setCurrency(account.getCurrency());
		accountPO.setBalance(account.getBalance());
		accountPO.setName(account.getName());
		em.persist(accountPO);
		em.flush();
	}

	@Override
	@Transactional
	public void removeAccount(final long accountID, final long userID) {
		logger.info("Method removeAccount invoked");
		Query query = em.createQuery("DELETE FROM AccountPO account "
				+ "WHERE account.id = :accountID AND account.userID = :userID");
		query.setParameter("accountID", accountID);
		query.setParameter("userID", userID);
		query.executeUpdate();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<AccountVO> getAccountsForUserID(final long userID) {
		logger.info("Method getAccountsForUserID invoked");
		Query query = em.createQuery("SELECT new pl.mc.finager.model.vo.AccountVO("
				+ "account.id, account.name, accountType.name, account.currency, "
				+ "account.balance) FROM AccountPO account "
				+ "JOIN AccountTypePO accountType ON account.type = accountType.id "
				+ "WHERE account.userID = :id", AccountVO.class);
		query.setParameter("id", userID);
		return (List<AccountVO>) query.getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public Map<Currency, BigDecimal> getTotalCashForUserID(final long userID) {
		logger.info("Method getTotalCashForUserID invoked");
		Query query = em.createQuery("SELECT account.currency, sum(account.balance) "
				+ "FROM AccountPO account WHERE account.userID = :id GROUP BY account.currency", Map.class);
		query.setParameter("id", userID);
		List<Object[]> results = query.getResultList();
		Map<Currency, BigDecimal> totalMap = new LinkedHashMap<Currency, BigDecimal>();
		for (Object[] result : results) {
			Currency currency = Currency.getInstance((String) result[0]);
			BigDecimal moneyAmount = (BigDecimal) result[1];
			totalMap.put(currency, moneyAmount.setScale(currency.getDefaultFractionDigits(), RoundingMode.UNNECESSARY));
		}
		return totalMap;
	}
}
