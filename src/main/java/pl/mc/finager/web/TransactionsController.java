package pl.mc.finager.web;

import java.security.Principal;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.service.AccountService;
import pl.mc.finager.service.TransactionService;

/**
 * Handles requests for the application transactions page.
 * @author mc
 */
@Controller
public class TransactionsController {
	
	private static final Logger logger = LoggerFactory.getLogger(TransactionsController.class);

	@Autowired
	private TransactionService transactionService;
	@Autowired
	private AccountService accountService;
	
	/** Simply selects the transactions view to render by returning its name. */
	@RequestMapping(value = "/transactions", method = RequestMethod.GET)
	public String transactions(Model model, Principal principal, Locale locale) {
		logger.info("TransactionsController");
		String name = principal.getName();
		model = populateModelAttributes(model, name, locale);
		return "transactions";
	}

	/** Adds attributes necessary for transactions view. */
	private Model populateModelAttributes(Model model, final String username, final Locale locale) {
		String activeView = new String("transactions");
		model.addAttribute("activeView", activeView);
		model.addAttribute("username", username);
		model.addAttribute("TransactionFO", new TransactionFO());
		return model;
	}
	
	/** Downloads list of the account from that belong to logged user. */
	@ModelAttribute("userAccountsMap")
	public Map<Long, String> populateAccountMap(final Principal principal) {
		String name = principal.getName();
		return accountService.getAvailableAccountsMap(name);
	}
	
	/** Downloads list of the available transaction categories from the database. */
	@ModelAttribute("categoriesMap")
	public Map<String, Map<Integer, String>> populateCategoriesMap() {
		return transactionService.getAllCategories();
	}
}
