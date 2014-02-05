package pl.mc.finager.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.model.vo.TransactionVO;
import pl.mc.finager.persistence.po.TransactionPO;

/**
 * JPA repository performing queries associated with Transaction entities.
 * @author mc
 */
@Repository
public class TransactionRepositoryJPA implements TransactionRepository {

	private static final Logger logger = LoggerFactory.getLogger(TransactionRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;
	
	@Override
	@Transactional
	public void addNewTransaction(final TransactionFO newTransaction, final long userID) {
		logger.info("Method addNewTransaction invoked");
		Long persistedTransactionNumber = null;

		// copy values that does not depend on transaction type
		TransactionPO transactionPO = new TransactionPO();
		transactionPO.setCategoryID(newTransaction.getCategoryID());
		transactionPO.setDate(newTransaction.getDate());
		transactionPO.setDescription(newTransaction.getDescription());
		
		// persist income
		if (newTransaction.getAccountToID() != null) {
			transactionPO.setAccountID(newTransaction.getAccountToID());
			transactionPO.setValue(newTransaction.getValue());
			transactionPO.setAccountBalanceAfter(
					newTransaction.getAccountToPreviousBalance().add(newTransaction.getValue()));
			em.persist(transactionPO);
			em.flush();
			persistedTransactionNumber = 
					(Long) em.getEntityManagerFactory().getPersistenceUnitUtil().getIdentifier(transactionPO);
		}
		// persist expense
		if (newTransaction.getAccountFromID() != null) {
			transactionPO.setAccountID(newTransaction.getAccountFromID());
			transactionPO.setValue(newTransaction.getValue().negate());
			transactionPO.setAccountBalanceAfter(
					newTransaction.getAccountFromPreviousBalance().subtract(newTransaction.getValue()));
			if (persistedTransactionNumber != null) {
				// if new transaction is of type transfer, we add one income
				// and one expense which have equal transaction numbers
				em.detach(transactionPO);
				transactionPO.setNumber(persistedTransactionNumber);
			}
			em.persist(transactionPO);
			em.flush();
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<TransactionVO> getTransactionsForUserID(final long userID, final Integer accountFilter) {
		logger.info("Method getTransactionsForUserID invoked");
		// TODO set transaction type?
		// TODO add filtering parameters - accountID, type, dateRange
		// TODO try to code this using Criteria API - more elegant
		StringBuffer queryString = new StringBuffer("SELECT new pl.mc.finager.model.vo.TransactionVO("
				+ "transaction.number, account.name, transaction.value, account.currency, "
				+ "transaction.date, category.name, transaction.description) "
				+ "FROM TransactionPO transaction "
				+ "JOIN AccountPO account ON transaction.accountID = account.id "
				+ "JOIN CategoryPO category ON transaction.categoryID = category.ID "
				+ "WHERE account.userID = :userID ");
		if (accountFilter != null) {
			queryString.append("AND account.id = :accountID ");
		} 
		queryString.append("ORDER BY transaction.number DESC, transaction.number DESC ");
		Query query = em.createQuery(queryString.toString(), TransactionVO.class);
		query.setParameter("userID", userID);
		if (accountFilter != null) {
			query.setParameter("accountID", accountFilter);
		} 
		return (List<TransactionVO>) query.getResultList();
	}

}
