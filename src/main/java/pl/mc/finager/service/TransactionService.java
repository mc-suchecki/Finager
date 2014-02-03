package pl.mc.finager.service;

import java.math.BigDecimal;
import java.util.Currency;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.Errors;

import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.model.vo.AccountVO;
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
	
	public Errors validateTransaction(final TransactionFO transaction) {
		Errors errors = new BeanPropertyBindingResult(transaction, "transactionFO");

		Integer accountToID = transaction.getAccountToID();
		Integer accountFromID = transaction.getAccountFromID();
		
		AccountVO involvedAccount;

		// transaction of transfer type 
		if (accountToID != null && accountFromID != null) {
			// check if accounts are different
			if (accountToID == accountFromID) {
				errors.rejectValue("accountToID", "errors.transaction.sameAccountToAndFrom", 
						"Account to and account from cannot be the same!");
				errors.rejectValue("accountFromID", "errors.transaction.sameAccountToAndFrom", 
						"Account to and account from cannot be the same!");
			}
			// check if involved accounts currencies are the same
			AccountVO accountTo = accountRepository.getAccountWithID(accountToID);
			AccountVO accountFrom = accountRepository.getAccountWithID(accountFromID);
			if (!accountTo.getCurrency().equals(accountFrom.getCurrency())) {
				errors.rejectValue("accountToID", "errors.transaction.differentCurrency", 
						"Account to and account from must have the same currency!");
				errors.rejectValue("accountFromID", "errors.transaction.differentCurrency", 
						"Account to and account from must have the same currency!");
			}
			// perform further checks on account to, because it is like from account
			involvedAccount = accountTo;
		} else if (accountToID != null) {						// income
			involvedAccount = accountRepository.getAccountWithID(accountToID);
		} else {																		// expense
			involvedAccount = accountRepository.getAccountWithID(accountFromID);
		}
		
	  // check if value is correct assuming selected currency
		Integer valueFractionDigits = transaction.getValue().scale();
		Integer currencyMaxFractionDigits = 
				Currency.getInstance(involvedAccount.getCurrency()).getDefaultFractionDigits();
		if (valueFractionDigits > currencyMaxFractionDigits) {
			errors.rejectValue("value", "errors.transaction.valueFractionDigits",
					"Transaction value has more fraction digits than currency limit!");
		}

		// TODO check if new transaction is last for that account
		// TODO check if assigned category comply with type

		return errors;
	}

	// TODO write comment - we assume here that transaction is valid and last!
	@Transactional
	public void addNewTransaction(final TransactionFO transaction, final String userEmail) {
		
		// download current accounts balance from database
		BigDecimal previousBalance;
		if (transaction.getAccountToID() != null) {
			previousBalance = 
					accountRepository.getAccountWithID(transaction.getAccountToID()).getBalanceNumber();
			transaction.setAccountToPreviousBalance(previousBalance);
		}
		if (transaction.getAccountFromID() != null) {
			previousBalance = 
					accountRepository.getAccountWithID(transaction.getAccountFromID()).getBalanceNumber();
			transaction.setAccountFromPreviousBalance(previousBalance);
		}

		// add the transaction
		transactionRepository.addNewTransaction(transaction, userRepository.getUserID(userEmail));

		// modify involved accounts balance
		if (transaction.getAccountToID() != null) {
			accountRepository.setAccountBalance(transaction.getAccountToID(), 
					transaction.getAccountToPreviousBalance().add(transaction.getValue()));
		}
		if (transaction.getAccountFromID() != null) {
			accountRepository.setAccountBalance(transaction.getAccountFromID(), 
					transaction.getAccountFromPreviousBalance().subtract(transaction.getValue()));
		}
	}
	
	public Map<String, Map<Integer, String>> getAllCategories() {
		return categoryRepository.getAllCategories();
	}

}
