package pl.mc.finager.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.persistence.AccountRepository;
import pl.mc.finager.persistence.CategoryRepository;
import pl.mc.finager.persistence.TransactionRepository;
import pl.mc.finager.persistence.UserRepository;

/**
 * Service handling operations associated with the Transactions.
 * @author mc
 */
@Service
public class TransactionService {

	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private TransactionRepository transactionRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	
	public void addNewTransaction(final TransactionFO transaction, final String userEmail) {
		
		// if transfer - check if involved accounts currencies are the same

		// add the transaction
		transactionRepository.addNewTransaction(transaction, userRepository.getUserID(userEmail));

		// check if new transaction is last for that account -
		// if not, there is a need for correcting all of the transactions
		// after that one

		// modify involved accounts balance
	}
	
	public Map<String, Map<Integer, String>> getAllCategories() {
		return categoryRepository.getAllCategories();
	}
}
