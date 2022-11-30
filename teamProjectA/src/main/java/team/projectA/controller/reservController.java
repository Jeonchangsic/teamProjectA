package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.projectA.service.LodgingService;
import team.projectA.service.UserService;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;


@Controller
public class reservController {
	
	private static final Logger logger = LoggerFactory.getLogger(reservController.class);
	
	@Autowired
	private LodgingService lodgingService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/reserv/reserv.do", method = RequestMethod.GET)
	public String reserv(Model model,String ridx, HttpServletRequest req) {
		

		
		
		
		RoomVO rvo = lodgingService.selectRoom(ridx);
		model.addAttribute("rvo", rvo);
		
		
		
		HttpSession session = req.getSession();
		
		RoomVO room = lodgingService.selectRoom(ridx);
		
		
		
		session.setAttribute("room", room);
		
		return "reservpage/reserv";
	}
	
}
