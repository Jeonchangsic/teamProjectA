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

import team.projectA.service.ReviewService;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/review") 
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review(int lidx, Locale locale, Model model) {
		
		model.addAttribute("lidx",lidx);
		
		return "review/review";
	}
	
	//리뷰작성
	@RequestMapping(value="/review.do", method= RequestMethod.POST)
	public String review(int lidx, String rvTitle, String rvSatisfaction, String rvContent, HttpServletResponse response, HttpServletRequest req) throws Exception{
		
		/* System.out.println("리뷰작성자:"+vo.getRvWriter()); */
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO)session.getAttribute("login"); 
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("uidx",userVO.getUidx());
		hm.put("lidx",lidx);
		hm.put("rvTitle", rvTitle);
		hm.put("rvSatisfaction", rvSatisfaction);
		hm.put("rvContent", rvContent);
		
		reviewService.rvInsert(hm);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('리뷰 작성이 완료되었습니다.');location.href='"+req.getContextPath()+"/mypage/info.do'</script>"); 
		out.flush(); 
		out.close();
		
		 
		return "";
		
	}
}