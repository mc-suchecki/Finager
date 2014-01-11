package pl.mc.finager.web;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application reports page.
 * @author mc
 */
@Controller
public class ReportsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportsController.class);
	
	/** Simply selects the reports view to render by returning its name. */
	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String reports(Model model, Principal principal) {
		logger.info("ReportsController");
		String name = principal.getName();
		model.addAttribute("username", name);
		String activeView = new String("reports");
		model.addAttribute("activeView", activeView);
		return activeView;
	}
	
}
