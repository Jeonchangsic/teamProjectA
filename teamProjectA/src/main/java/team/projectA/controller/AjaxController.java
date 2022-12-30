package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
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

import team.projectA.service.MypageService;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/ajax")
@Controller
public class AjaxController {
	
	@Autowired
	private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	
	//비밀번호 수정
	  @ResponseBody
	  @RequestMapping(value="pwModify.do", method = RequestMethod.POST) 
	  public String pwModify(HttpSession session, String password, HttpServletRequest req, HttpServletResponse response) throws Exception{
		  
		  
		  UserVO userVO = (UserVO)session.getAttribute("login");
		  
		  HashMap<String,Object> hm = new HashMap<String,Object>();
		  hm.put("password", password);
		  hm.put("userID", userVO.getUserID());
		  	int result = mypageService.changePw(hm); 
		  	
		  	String num = Integer.toString(result);
		  	
		  	return num;
	  }
	
	
}
