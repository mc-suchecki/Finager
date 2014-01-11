package pl.mc.finager.web;

import java.security.Principal;

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
	public String accounts(Model model, Principal principal) {
		logger.info("AccountsController");
		String name = principal.getName();
		model.addAttribute("username", name);
		String activeView = new String("accounts");
		model.addAttribute("activeView", activeView);
		return activeView;
	}
	
}
