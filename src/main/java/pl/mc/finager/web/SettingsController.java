package pl.mc.finager.web;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application settings page.
 * @author mc
 */
@Controller
public class SettingsController {
	
	private static final Logger logger = LoggerFactory.getLogger(SettingsController.class);
	
	/** Simply selects the settings view to render by returning its name. */
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settings(Model model, Principal principal) {
		logger.info("SettingsController");
		String name = principal.getName();
		model.addAttribute("username", name);
		String activeView = new String("settings");
		model.addAttribute("activeView", activeView);
		return activeView;
	}
	
}
