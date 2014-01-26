package pl.mc.finager.persistence;

import java.math.BigDecimal;
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
	@SuppressWarnings("unchecked")
	public List<AccountVO> getAccountsForUserID(final long userID) {
		logger.info("Method getAccountsForUserID invoked");
		Query query = em.createQuery("SELECT new pl.mc.finager.model.vo.AccountVO("
								+ "account.name, account.type, account.currency, account.balance) "
								+ "FROM AccountPO account WHERE account.userID = :id", AccountVO.class);
		query.setParameter("id", userID);
		return (List<AccountVO>) query.getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public String getTotalCashForUserID(final long userID) {
		logger.info("Method getTotalCashForUserID invoked");
		Query query = em.createQuery("SELECT account.currency, sum(account.balance) "
				+ "FROM AccountPO account WHERE account.userID = :id GROUP BY account.currency", Map.class);
		query.setParameter("id", userID);
		List<Object[]> results = query.getResultList();
		String description = new String();
		for (Object[] result : results) {
			description += result[1] + " " + result[0] + " ";
		}
		return description;
	}
}
