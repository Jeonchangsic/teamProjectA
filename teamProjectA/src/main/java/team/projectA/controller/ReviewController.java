package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import team.projectA.service.MypageService;
import team.projectA.service.ReviewService;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/review") 
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review(int lidx, int ridx,int reserv_idx, String lodgingname,String rtype,String reserv_startDate,String reserv_endDate, String limagename,Locale locale, Model model)throws Exception {
		
		

		model.addAttribute("lidx",lidx);
		model.addAttribute("ridx",ridx);
		model.addAttribute("reserv_idx",reserv_idx);
		model.addAttribute("lodgingname",lodgingname);
		model.addAttribute("rtype",rtype);
		model.addAttribute("reserv_startDate",reserv_startDate);
		model.addAttribute("reserv_endDate",reserv_endDate);
		model.addAttribute("limagename",limagename);
		
		
		return "review/review";
	}
	
	//리뷰작성
	@RequestMapping(value="/review.do", method= RequestMethod.POST)
	public String review(int lidx, int ridx, int reserv_idx, String rvTitle, String rvSatisfaction, String rvContent, HttpServletResponse response, HttpServletRequest req) throws Exception{
		
		
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO)session.getAttribute("login"); 
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("uidx",userVO.getUidx());
		hm.put("lidx",lidx);
		hm.put("ridx",ridx);
		hm.put("rvTitle", rvTitle);
		hm.put("rvSatisfaction", rvSatisfaction);
		hm.put("rvContent", rvContent);
		hm.put("reserv_idx", reserv_idx);
		
		reviewService.rvInsert(hm);
		reviewService.rvUpdate(reserv_idx);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('리뷰 작성이 완료되었습니다.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		 
		return "";
		
	}
}