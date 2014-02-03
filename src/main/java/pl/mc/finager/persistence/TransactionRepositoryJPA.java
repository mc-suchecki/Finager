package pl.mc.finager.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
			transactionPO.setValueTransferred(newTransaction.getValue());
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
			transactionPO.setValueTransferred(newTransaction.getValue().negate());
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
	public List<TransactionVO> getTransactionsForUserID(final long userID) {
		logger.info("Method getTransactionsForUserID invoked");
		// TODO Auto-generated method stub
		return null;
	}

}
