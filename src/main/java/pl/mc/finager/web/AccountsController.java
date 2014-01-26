package pl.mc.finager.web;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.Currency;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import pl.mc.finager.model.fo.AccountFO;
import pl.mc.finager.service.AccountService;

/**
 * Handles requests for the application accounts page.
 * @author mc
 */
@Controller
public class AccountsController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountsController.class);
	
	@Autowired
	private AccountService accountService;
	
	/** Simply selects the accounts to render by returning its name. */
	@RequestMapping(value = "/accounts", method = RequestMethod.GET)
	public String accounts(Model model, Principal principal, Locale locale) {
		logger.info("AccountsController");
		String name = principal.getName();
		model = populateModelAttributes(model, name, locale);
		return "accounts";
	}

	/** Adds new account or edits already created one. */
	@RequestMapping(value = "/accounts", method = RequestMethod.POST)
	public String addOrEditAccount(@ModelAttribute("AccountFO") AccountFO account,
		BindingResult result, SessionStatus status, Model model, Principal principal, Locale locale) {
		logger.info("AccountsController");

		// add new account and complete request
		String name = principal.getName();
		accountService.addNewAccount(account, name);
		model.addAttribute("accountAdded", true);
		status.setComplete();

		model = populateModelAttributes(model, name, locale);
		return "accounts";
	}

	/** Downloads list of the available account types from the database. */
	@ModelAttribute("accountTypesMap")
	public Map<Integer, String> populateAccountTypesMap() {
		return accountService.getAllAccountTypes();
	}
	
	/** Downloads list of the available currencies from the database. */
	@ModelAttribute("currenciesList")
	public List<String> populateCurrenciesList() {
		return accountService.getAllCurrencies();
	}
	
	/** Adds attributes necessary for accounts view. */
	private Model populateModelAttributes(Model model, final String username, final Locale locale) {
		String activeView = new String("accounts");
		model.addAttribute("activeView", activeView);
		model.addAttribute("username", username);
		model.addAttribute("AccountFO", new AccountFO());
		model.addAttribute("accountsList", accountService.getAccountsOfTheUser(username));
		model.addAttribute("totalCash", formatTotalCash(accountService.getTotalCashAmountForTheUser(username), locale));	
		return model;
	}
	
	/** Creates the String that displays total amount of cash on all of User Accounts. */
	private String formatTotalCash(Map<Currency, BigDecimal> totalMap, final Locale locale) {
		String formattedString = new String();
		for (Map.Entry<Currency, BigDecimal> entry : totalMap.entrySet()) {
			formattedString += entry.getValue().toPlainString() + " " + entry.getKey().getCurrencyCode() + "  ";
		}
		return formattedString;
	}
}
