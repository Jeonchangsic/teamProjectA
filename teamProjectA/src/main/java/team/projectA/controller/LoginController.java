package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender mailSender;
	
	
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
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1); </script>");
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
	
	//비밀번호찾기 페이지이동
	@RequestMapping(value = "/pwSearch.do",method = RequestMethod.GET)
	public String pwSearchPage(HttpServletRequest req) {
		
		return "login/pwSearch";
	}
	
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/pwSearch.do",method = RequestMethod.POST)
	public String pwSearch(String id, String email,HttpServletResponse response) throws Exception{

				int idSearch = userService.userSearch(id);
				
				
				if(idSearch == 1) {
					//임시비밀번호(난수) 생성
				Random random = new Random();
				int pw = random.nextInt(888888) + 111111; //111111 ~ 999999 의 수로 난수 생성하기 위함
				
				HashMap<String,Object> hm = new HashMap<String,Object>();
				hm.put("id",id);
				hm.put("pw",pw);
				
				int result = userService.pwUpdate(hm);
				
				
				//이메일 보내기
				String setFrom = "teamPjtA1@gmail.com"; //root-context.xml에 삽입한 자신의 이메일 계정 (메일 발신할 계정)
				String toMail = email; //입력받은 메일값
				String title = "저긴어때(주) 임시 비밀번호 발송입니다."; //발신 시 사용되는 이메일 제목
				String content = 								//발신 시 사용되는 이메일의 내용
						"저긴어때(주) 임시 비밀번호 발송입니다." +
				        "<br><br>" + 
		                "임시 비밀번호는 " + pw + "입니다." + 
		                "<br>" + 
		                "로그인 후 비밀번호를 변경 후 이용하시기를 권장합니다.";
				
				
					  try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
					  helper = new MimeMessageHelper(message,true,"utf-8");
					  helper.setFrom(setFrom); 			//메일 발신할 계정 
					  helper.setTo(toMail); 			//수신자 계정
					  helper.setSubject(title);			//발신 시 사용되는 이메일 제목 
					  helper.setText(content,true); 	//발신 시 사용되는 이메일 내용 
					  mailSender.send(message); 
					  }catch(Exception e){
					  e.printStackTrace(); 
					  }
				 
					String num = Integer.toString(result); //난수를 ajax를 통해 뷰로 다시 반환해야하는데 난수 생성 시 사용한 자료형은 int형이지만 ajax로 반환시에는 String형식만 가능하여 팟싱함
					
					return num;   //ResponseBody 어노테이션이 설정된 메소드는 반환값이 ajax의 success의 함수 매개변수로 들어간다. 그 값은 num.
				}else {
					/*
					 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
					 * response.getWriter();
					 * out.println("<script>alert('아이디 및 이메일을 확인해주세요.'); history.go(-1);</script>");
					 * out.flush(); out.close();
					 */
					return "";
				}
	}		
}
