package pl.mc.finager.persistence;

import java.util.List;

import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.model.vo.TransactionVO;

/**
 * Interface representing repositories performing queries associated with Transaction entities.
 * @author mc
 */
public interface TransactionRepository {

	/**
	 * Registers new transaction in the database.
	 * @param newTransaction POJO with new transaction data
	 * @param userID ID of the user which is adding the account
	 */
	void addNewTransaction(TransactionFO newTransaction, long userID);

	/**
	 * Returns list of all transactions that belong to user with given ID.
	 * TODO - add parameters for filtering results
	 * @param userID ID of the user who is the owner of the transactions
	 * @param accountFilter 
	 */
	List<TransactionVO> getTransactionsForUserID(long userID, Integer accountFilter);
}