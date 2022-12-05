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
	//�Ϲ� ȸ������ ������
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "join/join";
	}
	//�Ǹ��� ȸ������ ������
	@RequestMapping(value = "/sellerJoin.do", method = RequestMethod.GET)
	public String sellerJoin(Locale locale, Model model) {
		
		return "join/sellerJoin";
	}
	
	//�Ϲ� ȸ������ 
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(UserVO vo, HttpServletResponse response,HttpServletRequest req) throws Exception{
		
		UserService.userInsert(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<script>alert('ȸ�������� ���������� �Ϸ�Ǿ����ϴ�.');location.href='"+req.getContextPath()+"/index/index.do'</script>");
		out.flush();
		out.close();
		return "";
	}
	//�Ǹ��� ȸ������ 
	@RequestMapping(value = "/sellerJoin.do", method = RequestMethod.POST)
	public String sellerjoin(UserVO vo, HttpServletResponse response,HttpServletRequest req) throws Exception{
		
		UserService.sellerUserInsert(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<script>alert('�Ǹ��� ȸ�������� ���������� �Ϸ�Ǿ����ϴ�.');location.href='"+req.getContextPath()+"/index/index.do'</script>");
		out.flush();
		out.close();
		return "";
	}
	
	//���̵� �ߺ�üũ
	@ResponseBody
	@RequestMapping(value="/userForm.do")
	public String userForm(String userID) {
		int vo = UserService.userForm(userID);
		
		String result = Integer.toString(vo);
		
		return result;
	}
	
	//�̸��� ����
	@ResponseBody
	@RequestMapping(value="/mailCheck", method = RequestMethod.GET)
	public String mailCheck(String email) throws Exception{
		
		//ȭ�鿡�� �Ѿ�� ������ Ȯ��
		System.out.println("������ȣ"+email);
		
		//������ȣ(����) ����
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111; //111111 ~ 999999 �� ���� ���� �����ϱ� ����
		System.out.println("������ȣ"+checkNum); //������ȣ�� ������ �� �����ǰ� �ִ��� Ȯ��
		
		//�̸��� ������
		String setFrom = "teamproject_a@naver.com"; //root-context.xml�� ������ �ڽ��� �̸��� ���� (���� �߽��� ����)
		String toMail = email; //�Է¹��� ���ϰ�
		String title = "����(��) ȸ������ ���� �̸��� �Դϴ�."; //�߽� �� ���Ǵ� �̸��� ����
		String content = 								//�߽� �� ���Ǵ� �̸����� ����
				"����(��)�� �Բ� �Ͻð� �Ǿ� �����Դϴ�." +
		        "<br><br>" + 
                "���� ��ȣ�� " + checkNum + "�Դϴ�." + 
                "<br>" + 
                "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
		
		
		  try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		  helper = new MimeMessageHelper(message,true,"utf-8");
		  helper.setFrom(setFrom); //���� �߽��� ���� 
		  helper.setTo(toMail); //������ ����
		  helper.setSubject(title); //�߽� �� ���Ǵ� �̸��� ���� 
		  helper.setText(content,true); //�߽� �� ���Ǵ� �̸��� ���� 
		  mailSender.send(message); 
		  }catch(Exception e){
		  e.printStackTrace(); 
		  }
		 
		String num = Integer.toString(checkNum); //������ ajax�� ���� ��� �ٽ� ��ȯ�ؾ��ϴµ� ���� ���� �� ����� �ڷ����� int�������� ajax�� ��ȯ�ÿ��� String���ĸ� �����Ͽ� �̽���
		
		return num;   //ResponseBody ������̼��� ������ �޼ҵ�� ��ȯ���� ajax�� success�� �Լ� �Ű������� ����. �� ���� num.
	}
}
