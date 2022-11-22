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
public class TripController {
	
	private static final Logger logger = LoggerFactory.getLogger(TripController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/trip/Nature.do", method = RequestMethod.GET)
	public String Nature(Locale locale, Model model) {
		
		return "index/trip/NatureTrip";
	}
	@RequestMapping(value = "/trip/HanokVillage.do", method = RequestMethod.GET)
	public String HanokVillage(Locale locale, Model model) {
		
		return "index/trip/HanokVillageTrip";
	}
	@RequestMapping(value = "/trip/DeokjinPark.do", method = RequestMethod.GET)
	public String DeokjinPark(Locale locale, Model model) {
		
		return "index/trip/DeokjinParkTrip";
	}
	
	
}
