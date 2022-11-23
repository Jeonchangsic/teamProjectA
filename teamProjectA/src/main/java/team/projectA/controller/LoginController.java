package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.projectA.service.UserService;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/login")
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)  // 
	public String login(Locale locale, Model model) {
		
		
		
		return "login/login";
	}
	@RequestMapping(value="/login.do", method = RequestMethod.POST)  
	public String login(UserVO vo,HttpServletRequest req ,HttpServletResponse response)throws Exception {
		
		
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = userService.login(vo);
		
		if(loginVO != null) { //로그인이 된 경우.
			session.setAttribute("login", loginVO);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			out.close();
			
		}
		return "redirect:/index/index.do";
		
		
	}
	
	@RequestMapping(value = "/logout/logout.do")
	public String logout(HttpServletRequest req) {
		
	
		HttpSession session = req.getSession();
		session.invalidate(); //세션을 사용한 정보를 초기화 하는 invalidate(). 로그아웃처리.
		
		return "redirect:/";
	}

}
