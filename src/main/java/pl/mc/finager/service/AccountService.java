package pl.mc.finager.service;

import java.math.BigDecimal;
import java.util.Currency;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.mc.finager.model.fo.AccountFO;
import pl.mc.finager.model.vo.AccountVO;
import pl.mc.finager.persistence.AccountRepository;
import pl.mc.finager.persistence.AccountTypeRepository;
import pl.mc.finager.persistence.CurrencyRepository;
import pl.mc.finager.persistence.UserRepository;

/**
 * Service handling operations associated with the Accounts.
 * @author mc
 */
@Service
public class AccountService {

	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private AccountTypeRepository accountTypesRepository;
	@Autowired
	private CurrencyRepository currenciesRepository;
	@Autowired
	private UserRepository userRepository;

	public Map<Integer, String> getAllAccountTypes() {
		return accountTypesRepository.getAllAccountTypes();
	}
	
	public List<String> getAllCurrencies() {
		return currenciesRepository.getAllCurrencies();
	}

	public void addNewAccount(final AccountFO account, final String userEmail) {
		accountRepository.addNewAccount(account, userRepository.getUserID(userEmail));
	}
	
	public void removeAccount(final long accountID, final String userEmail) {
		accountRepository.removeAccount(accountID, userRepository.getUserID(userEmail));
	}
	
	public List<AccountVO> getAccountsOfTheUser(final String userEmail) {
		return accountRepository.getAccountsForUserID(userRepository.getUserID(userEmail));
	}
	
	public Map<Currency, BigDecimal> getTotalCashAmountForTheUser(final String userEmail) {
		return accountRepository.getTotalCashForUserID(userRepository.getUserID(userEmail));
	}
}
