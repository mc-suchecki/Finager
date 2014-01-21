package pl.mc.finager.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import pl.mc.finager.model.fo.UserFO;
import pl.mc.finager.service.UserService;

/**
 * Manages users login and registration.
 * @author mc
 */
@Controller
public class LoginController {

	@Autowired
	UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String displayLoginPage(Model model) {
		logger.info("LoginController");
		return "login";
	}

	@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
	public String displayLoginError(Model model) {
		logger.info("LoginController");
		model.addAttribute("error", "true");
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		logger.info("LoginController");
		model.addAttribute("loggedOut", "true");
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String displayRegisterForm(Model model) {
		logger.info("LoginController");
		model.addAttribute("UserFO", new UserFO());
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("UserFO") UserFO user,
		BindingResult result, SessionStatus status, Model model) {
		userService.registerNewUser(user);
		status.setComplete();
		model.addAttribute("registered", "true");
		return "login";
	}
}
