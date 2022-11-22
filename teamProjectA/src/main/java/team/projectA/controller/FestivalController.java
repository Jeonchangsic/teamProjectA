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
public class FestivalController {
	
	private static final Logger logger = LoggerFactory.getLogger(FestivalController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/festival/NamgangYudeung.do", method = RequestMethod.GET)
	public String NamgangYudeung(Locale locale, Model model) {
		
		return "index/festival/NamgangYudeungFestival";
	}
	@RequestMapping(value = "/festival/YeosuFireworks.do", method = RequestMethod.GET)
	public String YeosuFireworks(Locale locale, Model model) {
		
		return "index/festival/YeosuFireworksFestival";
	}
	@RequestMapping(value = "/festival/Chunhyang.do", method = RequestMethod.GET)
	public String Chunhyang(Locale locale, Model model) {
		
		return "index/festival/ChunhyangFestival";
	}
	
	
}
