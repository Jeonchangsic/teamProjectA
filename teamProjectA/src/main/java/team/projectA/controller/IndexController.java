package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.projectA.service.IndexService;
import team.projectA.service.UserService;
import team.projectA.vo.ReviewVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET) //���� �� ����������.
	public String index(Locale locale, Model model)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<ReviewVO> list = indexService.popLodgingList();

		
		model.addAttribute("list",list);
		model.addAttribute("serverTime", formattedDate );
		
		
		
		return "index/index";
	}
	
	@RequestMapping(value = "/index/index.do", method = RequestMethod.GET)  // index�������� �̵�
	public String backIndex(Locale locale, Model model)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		List<ReviewVO> list = indexService.popLodgingList2();

		
		model.addAttribute("list",list);
		
		return "index/index";
	}
	
}
