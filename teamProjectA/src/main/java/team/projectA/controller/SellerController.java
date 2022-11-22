package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.projectA.service.SellerService;
import team.projectA.vo.LodgingVO;
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
	public String sellerInfo(Locale locale, Model model) {
		

		UserVO vo = sellerService.SellerOne(2);
	
		model.addAttribute("vo", vo);
		
		System.out.println(vo);
		
		
		
		return "seller/sellerInfo";
	}
	
	@RequestMapping (value ="/sellerInfo1.do", method = RequestMethod.POST)
	public String sellerInfo(UserVO vo, HttpServletResponse res)throws Exception{
	

		 sellerService.sellerUpdate(vo);
		 System.out.println(vo.getUserEmail());
		 System.out.println(vo.getUserPhone());
		 
		 PrintWriter pw = res.getWriter();

			
		
		return "redirect: sellerInfo.do";
			
	}

	
	@RequestMapping (value ="/sellerInfo2.do", method = RequestMethod.POST)
	public String sellerInfo(LodgingVO vo, HttpServletResponse res)throws Exception{
		
		 System.out.println(vo.getLodgingname());
		 System.out.println(vo.getLodgingaddr());
		 System.out.println(vo.getLidx());


		 

		sellerService.sellerUpdate2(vo);
		
		
		
		PrintWriter pw = res.getWriter();
		 
		return "redirect: sellerInfo.do";
		
	}

		
		
	
	@RequestMapping(value = "/sellerInquire.do", method = RequestMethod.GET)
	public String sellerInquire(Locale locale, Model model) {
		
		return "seller/sellerInquire";
	}
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.GET)
	public String sellerInquireWrite(Locale locale, Model model) {
		
		return "seller/sellerInquireWrite";
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
