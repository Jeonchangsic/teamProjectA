package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping(value="/join")
@Controller
public class JoinController {
	
	@Autowired
	private UserService UserService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "join/join";
	}
	
	//회원가입 
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(UserVO vo, HttpServletResponse response,HttpServletRequest req) throws Exception{
		
		UserService.userInsert(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<script>alert('회원가입이 정상적으로 완료되었습니다.');location.href='"+req.getContextPath()+"/index/index.do'</script>");
		out.flush();
		out.close();
		return "";
	}
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/userForm.do")
	public String userForm(String userID) {
		int vo = UserService.userForm(userID);
		
		String result = Integer.toString(vo);
		
		return result;
	}
	
}
