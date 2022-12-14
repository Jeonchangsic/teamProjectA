package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping(value="/join")
@Controller
public class JoinController {
	
	@Autowired
	private UserService UserService;
	@Autowired
	private JavaMailSender mailSender;
	
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	//일반 회원가입 페이지
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "join/join";
	}
	//판매자 회원가입 페이지
	@RequestMapping(value = "/sellerJoin.do", method = RequestMethod.GET)
	public String sellerJoin(Locale locale, Model model) {
		
		return "join/sellerJoin";
	}
	
	//일반 회원가입 
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
	//판매자 회원가입 
	@RequestMapping(value = "/sellerJoin.do", method = RequestMethod.POST)
	public String sellerjoin(UserVO vo, HttpServletResponse response,HttpServletRequest req) throws Exception{
		
		UserService.sellerUserInsert(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<script>alert('판매자 회원가입이 정상적으로 완료되었습니다.');location.href='"+req.getContextPath()+"/index/index.do'</script>");
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
	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value="/mailCheck", method = RequestMethod.GET)
	public String mailCheck(String email) throws Exception{
		
		//화면에서 넘어온 데이터 확인
		System.out.println("인증번호"+email);
		
		//인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111; //111111 ~ 999999 의 수로 난수 생성하기 위함
		System.out.println("인증번호"+checkNum); //인증번호가 난수로 잘 생성되고 있는지 확인
		
		//이메일 보내기
		String setFrom = "teamproject_a@naver.com"; //root-context.xml에 삽입한 자신의 이메일 계정 (메일 발신할 계정)
		String toMail = email; //입력받은 메일값
		String title = "저긴어때(주) 회원가입 인증 이메일 입니다."; //발신 시 사용되는 이메일 제목
		String content = 								//발신 시 사용되는 이메일의 내용
				"저긴어때(주)와 함께 하시게 되어 영광입니다." +
		        "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		
		  try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		  helper = new MimeMessageHelper(message,true,"utf-8");
		  helper.setFrom(setFrom); //메일 발신할 계정 
		  helper.setTo(toMail); //수신자 계정
		  helper.setSubject(title); //발신 시 사용되는 이메일 제목 
		  helper.setText(content,true); //발신 시 사용되는 이메일 내용 
		  mailSender.send(message); 
		  }catch(Exception e){
		  e.printStackTrace(); 
		  }
		 
		String num = Integer.toString(checkNum); //난수를 ajax를 통해 뷰로 다시 반환해야하는데 난수 생성 시 사용한 자료형은 int형이지만 ajax로 반환시에는 String형식만 가능하여 팟싱함
		
		return num;   //ResponseBody 어노테이션이 설정된 메소드는 반환값이 ajax의 success의 함수 매개변수로 들어간다. 그 값은 num.
	}
}
