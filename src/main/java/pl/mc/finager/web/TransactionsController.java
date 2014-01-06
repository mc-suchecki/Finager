package pl.mc.finager.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application transactions page.
 * @author mc
 */
@Controller
public class TransactionsController {
	
	private static final Logger logger = LoggerFactory.getLogger(TransactionsController.class);
	
	/** Simply selects the transactions view to render by returning its name. */
	@RequestMapping(value = "/transactions", method = RequestMethod.GET)
	public String transactions(Locale locale, Model model) {
		logger.info("Welcome in transactions! The client locale is {}.", locale);
		String activeView = new String("transactions");
		model.addAttribute("activeView", activeView);
		return activeView;
	}
	
}
