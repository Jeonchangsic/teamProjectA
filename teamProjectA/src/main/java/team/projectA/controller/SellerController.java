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
	@RequestMapping(value = "/sellerInfo.do", method = RequestMethod.GET)
														 //session 불러내기 위해서 필요 
	public String sellerInfo(Locale locale, Model model,  HttpServletRequest req, LodgingVO vo, String uidx) {
		
		
		
		//session 선언
		HttpSession session = req.getSession();
		//로그인한 uidx값만 넘어오게 만들기
		UserVO login = (UserVO) session.getAttribute("login");
		vo.setUidx(login.getUidx());
		model.addAttribute("vo", login);
		
	
		
		LodgingVO vo2 = (LodgingVO)sellerService.SellerOne(uidx);
		model.addAttribute("vo2", vo);
		

		
		System.out.println(vo);
		
		
		
		return "seller/sellerInfo";
	}
	
    //정보수정1 회원정보
	@RequestMapping (value ="/sellerInfo1.do", method = RequestMethod.POST)
	public String sellerInfo(UserVO vo, HttpServletResponse res)throws Exception{
	

		 sellerService.sellerUpdate(vo);

		 
		 PrintWriter pw = res.getWriter();

			
		
		return "redirect: sellerInfo.do";
			
	}

	//정보수정2  숙소정보
	@RequestMapping (value ="/sellerInfo2.do", method = RequestMethod.POST)
	public String sellerInfo(LodgingVO vo, HttpServletResponse res)throws Exception{
		
		
		sellerService.sellerUpdate2(vo);
		
		
		
		PrintWriter pw = res.getWriter();
		 
		return "redirect: sellerInfo.do";
		
	}

		
		
	//문의리스트
	@RequestMapping(value = "/sellerInquire.do", method = RequestMethod.GET)
	public String sellerInquire(Model model,HttpServletRequest req ){
		
		//session 선언
		HttpSession session = req.getSession();
		//로그인한 uidx값만 넘어오게 만들기
		UserVO login = (UserVO) session.getAttribute("login");
	
			
		List<QnaVO> qnaList = sellerService.qnaList(login.getUidx()); 
		model.addAttribute("qnaList", qnaList);
		

		
		return "seller/sellerInquire";
	}
	
	//문의내용
	@RequestMapping(value="/sellerInquireView.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int uidx) {
		
		QnaVO qnaOne = (QnaVO)sellerService.qnaOne(uidx);
		model.addAttribute("qnaOne", qnaOne);

		
		
		return "seller/sellerInquireView";
	
		
		
	}
	//문의하기 페이지로딩
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.GET)
	public String sellerInquireWrite(Locale locale, Model model) {
		

	
		return "seller/sellerInquireWrite";
	}
	
	
	//문의하기 post
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.POST)
	public String sellerInquireWrite(QnaVO vo, HttpServletRequest req, HttpServletResponse response)throws Exception {
		
		//session을 불러옴 
		HttpSession session = req.getSession();
		
		//login변수에  session에 넣어져있던(userController) "login"을 저장함
		UserVO login = (UserVO)session.getAttribute("login");
		
		
		vo.setUidx(login.getUidx());
		
		//result에 sellerService에 있던 qnaInsert를 저장 / 사용안했는데 왜 있지?
		int result = sellerService.qnaInsert(vo);
		
	
		//return할때 uidx을 넘기고 +로 Qna_idx값을 붙여줌 
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
