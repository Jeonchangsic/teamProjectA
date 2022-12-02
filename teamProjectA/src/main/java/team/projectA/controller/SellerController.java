package team.projectA.controller;


import java.io.Console;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team.projectA.service.SellerService;

import team.projectA.vo.LodgingVO;

import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/seller")
@Controller
public class SellerController {
	
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);
	 

	
	@Autowired
	private SellerService sellerService;

	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @param sellerService 
	 */
	
	//ȸ������ȭ��
	@RequestMapping(value = "/sellerInfo.do", method = RequestMethod.GET)														 //session �ҷ����� ���ؼ� �ʿ� 
	public String sellerInfo(Locale locale, Model model,  HttpServletRequest req) {

		  //session ����
		  HttpSession session = req.getSession(); //�α����� uidx���� �Ѿ���� ����� UserVO login =
		  UserVO login = (UserVO) session.getAttribute("login"); 
		  model.addAttribute("vo", login);
		 
		  
		  LodgingVO lodging = sellerService.SellerOne(login.getUidx());
		 
		  
		  model.addAttribute("lodging",lodging);
		  


		
		return "seller/sellerInfo";
	}
	
    //��������1 ȸ������
	@RequestMapping (value ="/sellerInfo1.do", method = RequestMethod.POST)
	public String sellerInfo(UserVO vo, HttpServletRequest req)throws Exception{

		System.out.println("email"+vo.getUserEmail());
		 
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
		
		vo.setUidx(login.getUidx());
		

	
		int result = sellerService.sellerUpdate(vo);
		
		
		
	//	System.out.println("��ȣ"+login.getUserPhone());
	//	System.out.println("�̸���"+vo.getUserEmail());
	//	System.out.println("��й�ȣ"+vo.getUserPassword());
		
		

		
		 

		return "redirect: sellerInfo.do";
			
	}

	//��������2  ��������
	@RequestMapping (value ="/sellerInfo2.do", method = RequestMethod.POST)
	public String sellerInfo(LodgingVO vo, HttpServletRequest req)throws Exception{
		
	
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
	
		vo.setUidx(login.getUidx());
	
		int result = sellerService.sellerUpdate2(vo);

		
		return "redirect: sellerInfo.do";
		
	}

		
		
	//���Ǹ���Ʈ + ����¡
    @RequestMapping(value = "/sellerInquire.do", method = RequestMethod.GET)
    public String sellerInquire(Model model,HttpServletRequest req){
 
                                                                        
        HttpSession session = req.getSession();                                //�α��� uidx        
        UserVO login = (UserVO) session.getAttribute("login");
        List<QnaVO> qnaList = sellerService.qnaList(login.getUidx()); 

        //qnaList�� �Ű������� loing�� ����� uidx�� �ɾ��� 
       //== ȭ�鿡 ���� uidx�� �ش��ϴ� ����� qanList�� �����ش�


       model.addAttribute("qnaList", qnaList);
                
        return "seller/sellerInquire";
    }
    
	//���ǳ���
	@RequestMapping(value="/sellerInquireView.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int QnA_idx) {
		
		
		
			QnaVO vo = (QnaVO)sellerService.qnaOne(QnA_idx);
			model.addAttribute("vo",vo);
			
		
		
		return "seller/sellerInquireView";
	
		
		
	}
	//�����ϱ� �������ε�
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.GET)
	public String sellerInquireWrite(Locale locale, Model model) {
		

	
		return "seller/sellerInquireWrite";
	}
	
	
	//�����ϱ� post
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.POST)
	public String sellerInquireWrite(QnaVO vo, HttpServletRequest req, HttpServletResponse response)throws Exception {
		
		//session�� �ҷ��� 
		HttpSession session = req.getSession();
		
		//login������  session�� �־����ִ�(userController) "login"�� ������ ������
		UserVO login = (UserVO)session.getAttribute("login");
		
		//vo�� �ʿ��� Ű���� �־��ֱ�
		vo.setUidx(login.getUidx());
		
		//result�� sellerService�� �ִ� qnaInsert�� ���� / �����ߴµ� �� ����?
		int result = sellerService.qnaInsert(vo);
		
	
		//return�Ҷ� uidx�� �ѱ�� +�� Qna_idx���� �ٿ��� 
		return "redirect: sellerInquire.do?=uidx"+vo.getQnA_idx();	

	}
	
	
	@RequestMapping(value = "/sellerRoomup1.do", method = RequestMethod.GET)
	public String roomup1(Locale locale, Model model) {
		
	//roomup
		
		return "seller/sellerRoomup1";
	}
	@RequestMapping(value = "/sellerRoomup2.do", method = RequestMethod.GET)
	public String roomup2(Locale locale, Model model) {
		
	
		
		return "seller/sellerRoomup2";
	}
	
	@RequestMapping(value = "/sellerRoomup3.do", method = RequestMethod.GET)
	public String roomup3(Locale locale, Model model) {
		
	
		
		return "seller/sellerRoomup3";
	}
	@RequestMapping(value = "/sellerRegi.do", method = RequestMethod.GET)
	public String Regi(Locale locale, Model model, HttpServletRequest req, RoomVO vo) {
		
	
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		List<RoomVO> roomlist = sellerService.roomlist(login.getUidx());
		
		model.addAttribute("roomlist", roomlist);
		
		
		return "seller/sellerRegi";
	}
	
	@RequestMapping(value = "/sellerLodgingModify.do", method = RequestMethod.GET)
	public String sellerLodgingModify(Locale locale, Model model) {
		
		
		
	
		return "seller/sellerLodgingModify";
	}
}
