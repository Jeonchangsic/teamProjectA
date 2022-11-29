package team.projectA.controller;


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
	
	
	@RequestMapping(value = "/sellerInfo.do", method = RequestMethod.GET)														 //session 불러내기 위해서 필요 
	public String sellerInfo(Locale locale, Model model,  HttpServletRequest req) {

			//session 선언
		  HttpSession session = req.getSession(); 
		  //session 불러내기 위해서 필요 
		  UserVO login = (UserVO) session.getAttribute("login"); 
		  model.addAttribute("vo", login);
		 
		  
		  LodgingVO lodging = sellerService.SellerOne(login.getUidx());
		 
		  
		  model.addAttribute("lodging",lodging);
		  


		
		return "seller/sellerInfo";
	}
	
	//정보수정1 회원정보
	@RequestMapping (value ="/sellerInfo1.do", method = RequestMethod.POST)
	public String sellerInfo(UserVO vo, HttpServletRequest req)throws Exception{

		System.out.println("email"+vo.getUserEmail());
		 
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
		
		vo.setUidx(login.getUidx());
		

	
		int result = sellerService.sellerUpdate(vo);
		
		
		
	//	System.out.println("踰덊샇"+login.getUserPhone());
	//	System.out.println("�씠硫붿씪"+vo.getUserEmail());
	//	System.out.println("鍮꾨�踰덊샇"+vo.getUserPassword());
		
		

		
		 

		return "redirect: sellerInfo.do";
			
	}

	//�젙蹂댁닔�젙2  �닕�냼�젙蹂�
	@RequestMapping (value ="/sellerInfo2.do", method = RequestMethod.POST)
	public String sellerInfo(LodgingVO vo, HttpServletRequest req)throws Exception{
		
	
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
	
		vo.setUidx(login.getUidx());
	
		int result = sellerService.sellerUpdate2(vo);

		
		return "redirect: sellerInfo.do?=uidx"+vo.getUidx();
		
	}

		
		
	//臾몄쓽由ъ뒪�듃
	@RequestMapping(value = "/sellerInquire.do", method = RequestMethod.GET)
	public String sellerInquire(Model model,HttpServletRequest req ){
		
		//session �꽑�뼵
		HttpSession session = req.getSession();
		//濡쒓렇�씤�븳 uidx媛믪쓣 諛쏄퀬
		UserVO login = (UserVO) session.getAttribute("login");
	
	    //qnaList�뿉 留ㅺ컻蹂��닔濡� loing�븳 �궗�엺�쓽 uidx瑜� 嫄몄뼱以� 
		//== �솕硫댁뿉 �뱾�뼱�삩 uidx�뿉 �빐�떦�븯�뒗 �궗�엺�쓽 qanList留� 蹂댁뿬以��떎
		List<QnaVO> qnaList = sellerService.qnaList(login.getUidx()); 
		model.addAttribute("qnaList", qnaList);
	

		
		return "seller/sellerInquire";
	}
	
	//臾몄쓽�궡�슜
	@RequestMapping(value="/sellerInquireView.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int QnA_idx) {
		
		
		
			QnaVO vo = (QnaVO)sellerService.qnaOne(QnA_idx);
			model.addAttribute("vo",vo);
		/*
		 * QnaVO qnaOne = (QnaVO)sellerService.qnaOne(QnA_idx);
		 * model.addAttribute("qnaOne", qnaOne);
		 */
		
		
		return "seller/sellerInquireView";
	
		
		
	}
	//臾몄쓽�븯湲� �럹�씠吏�濡쒕뵫
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.GET)
	public String sellerInquireWrite(Locale locale, Model model) {
		

	
		return "seller/sellerInquireWrite";
	}
	
	
	//臾몄쓽�븯湲� post
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.POST)
	public String sellerInquireWrite(QnaVO vo, HttpServletRequest req, HttpServletResponse response)throws Exception {
		
		//session�쓣 遺덈윭�샂 
		HttpSession session = req.getSession();
		
		//login蹂��닔�뿉  session�뿉 �꽔�뼱�졇�엳�뜕(userController) "login"�쓣 爰쇰궡�꽌 ���옣�븿
		UserVO login = (UserVO)session.getAttribute("login");
		
		//vo�뿉 �븘�슂�븳 �궎媛믪쓣 �꽔�뼱二쇨린
		vo.setUidx(login.getUidx());
		
		//result�뿉 sellerService�뿉 �엳�뜕 qnaInsert瑜� ���옣 / �궗�슜�븞�뻽�뒗�뜲 �솢 �엳吏�?
		int result = sellerService.qnaInsert(vo);
		
	
		//return�븷�븣 uidx�쓣 �꽆湲곌퀬 +濡� Qna_idx媛믪쓣 遺숈뿬以� 
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
	public String Regi(Locale locale, Model model) {
		
	
		
		return "seller/sellerRegi";
	}
	@RequestMapping(value = "/sellerLodgingModify.do", method = RequestMethod.GET)
	public String sellerLodgingModify(Locale locale, Model model) {
		
	
		
		return "seller/sellerLodgingModify";
	}
}
