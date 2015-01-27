package pl.mc.finager.web;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.mc.finager.model.JSONChartData;
import pl.mc.finager.model.JSONFilterValues;
import pl.mc.finager.service.AccountService;
import pl.mc.finager.service.TransactionService;

/**
 * Handles requests for the application reports page.
 * @author mc
 */
@Controller
@RequestMapping(value = "/reports")
public class ReportsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportsController.class);
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private TransactionService transactionService;
	
	/** Simply selects the reports view to render by returning its name. */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String reports(Model model, Principal principal) {
		logger.info("ReportsController");
		String name = principal.getName();
		model.addAttribute("username", name);
		String activeView = new String("reports");
		model.addAttribute("activeView", activeView);
		return activeView;
	}

	@RequestMapping(value = "/getData", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<JSONChartData> getData(@RequestBody final JSONFilterValues filterValues, final Principal principal) {
		return transactionService.getReportsData(principal.getName(), filterValues);
	}

	/** Downloads list of the account from that belong to logged user. */
	@ModelAttribute("userAccountsMap")
	public Map<Long, String> populateAccountMap(final Principal principal) {
		String name = principal.getName();
		return accountService.getAvailableAccountsMap(name);
	}
	
}
