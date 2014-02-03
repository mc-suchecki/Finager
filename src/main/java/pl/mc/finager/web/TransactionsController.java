package pl.mc.finager.web;

import java.security.Principal;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.mc.finager.model.JSONValidationResponse;
import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.service.AccountService;
import pl.mc.finager.service.TransactionService;

/** 
 * Handles requests for the application transactions page.
 * @author mc
 */
@Controller
@RequestMapping(value = "/transactions")
public class TransactionsController {

	private static final Logger logger = LoggerFactory.getLogger(TransactionsController.class);

	@Autowired
	private TransactionService transactionService;
	@Autowired
	private AccountService accountService;

	/** Returns the transactions view. */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showTransactions(Model model, Principal principal, Locale locale) {
		logger.info("showTransactions");
		String name = principal.getName();
		model = populateModelAttributes(model, name, locale);
		return "transactions";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody JSONValidationResponse createTransaction(@Valid @RequestBody TransactionFO transaction, BindingResult result, final Principal principal) {
		logger.info("createTransaction");
		
		JSONValidationResponse response = new JSONValidationResponse();
		result.addAllErrors(transactionService.validateTransaction(transaction));
		if(result.hasErrors()) {
			response.setSuccess(false);
			response.setResult(result.getAllErrors());
		} else {
			response.setSuccess(true);
			String name = principal.getName();
		  transactionService.addNewTransaction(transaction, name);
			//response.setResult(transactionService.getAllTransactions());
		}
		
		return response;
	}

	/** Adds attributes necessary for transactions view. */
	private Model populateModelAttributes(Model model, final String username, final Locale locale) {
		String activeView = new String("transactions");
		model.addAttribute("activeView", activeView);
		model.addAttribute("username", username);
		model.addAttribute("transactionFO", new TransactionFO());
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
