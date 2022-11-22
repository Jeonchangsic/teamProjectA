package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class reservController {
	
	private static final Logger logger = LoggerFactory.getLogger(reservController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/reserv/reserv.do", method = RequestMethod.GET)
	public String reserv(Locale locale, Model model) {
		
		return "reservpage/reserv";
	}
	
}
