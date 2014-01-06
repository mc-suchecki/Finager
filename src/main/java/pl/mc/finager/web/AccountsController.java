package pl.mc.finager.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application accounts page.
 * @author mc
 */
@Controller
public class AccountsController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountsController.class);
	
	/** Simply selects the accounts to render by returning its name. */
	@RequestMapping(value = "/accounts", method = RequestMethod.GET)
	public String accounts(Locale locale, Model model) {
		logger.info("Welcome in accounts! The client locale is {}.", locale);
		String activeView = new String("accounts");
		model.addAttribute("activeView", activeView);
		return activeView;
	}
	
}
