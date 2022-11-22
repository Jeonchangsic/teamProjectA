package team.projectA.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/logout")
@Controller
public class LogoutController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(LogoutController.class);
	

	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest req) {
		
	
		HttpSession session = req.getSession();
		session.invalidate(); //������ ����� ������ �ʱ�ȭ �ϴ� invalidate(). �α׾ƿ�ó��.
		
		return "redirect:/";
	}
}
