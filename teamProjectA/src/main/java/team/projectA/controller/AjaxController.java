package team.projectA.controller;

import java.io.PrintWriter;
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

import team.projectA.service.ManagerService;
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
	@Autowired
	private ManagerService managerService;
	
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

		  	session.invalidate();
		  	return num;
	  }
	//관리자 페스티발 메인등록 
		@ResponseBody
		@RequestMapping(value="festivalReg.do", method = RequestMethod.GET)
		public String festivalReg(int ftidx){
			
			
			int resultFtidx = managerService.festivalReg(ftidx);
			
			String result = Integer.toString(resultFtidx);
			
			return "result";
		}
		//관리자 페스티발 메인삭제
		@ResponseBody
		@RequestMapping(value="festivalRegDt.do", method = RequestMethod.GET)
		public String festivalRegDt(int ftidx){
			
			
			int resultFtidx = managerService.festivalRegDt(ftidx);
			
			String result = Integer.toString(resultFtidx);
			
			return "result";
		}
		//관리자 여행지 메인등록 
		@ResponseBody
		@RequestMapping(value="tripReg.do", method = RequestMethod.GET)
		public String tripReg(int tidx){
			
			
			int resultTidx = managerService.tripReg(tidx);
			
			String result = Integer.toString(resultTidx);
			
			return "result";
		}
		//관리자 페스티발 메인삭제
		@ResponseBody
		@RequestMapping(value="tripRegDt.do", method = RequestMethod.GET)
		public String tripRegDt(int tidx){
			
			
			int resultTidx = managerService.tripRegDt(tidx);
			
			String result = Integer.toString(resultTidx);
			
			return "result";
		}
	
}
