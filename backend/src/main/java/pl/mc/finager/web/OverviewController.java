package pl.mc.finager.web;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application overview page.
 * @author mc
 */
@Controller
public class OverviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(OverviewController.class);
	
	/** Simply selects the overview to render by returning its name. */
	@RequestMapping(value = {"/","/overview"}, method = RequestMethod.GET)
	public String overview(Model model, Principal principal) {
		logger.info("OverviewController");
		// FIXME - here could be NullPointer when cookie expired!
		String name = principal.getName();
		model.addAttribute("username", name);
		String activeView = new String("overview");
		model.addAttribute("activeView", activeView);
		return activeView;
	}
	
}
