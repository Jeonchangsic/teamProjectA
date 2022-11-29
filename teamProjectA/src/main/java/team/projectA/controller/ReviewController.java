package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
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
	public String review(Locale locale, Model model) {
		
		
		
		return "review/review";
	}
	
	//리뷰작성
	@RequestMapping(value="/review.do", method= RequestMethod.POST)
	public String review(ReviewVO vo, HttpServletResponse response, HttpServletRequest req) throws Exception{
		
		/* System.out.println("리뷰작성자:"+vo.getRvWriter()); */
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO)session.getAttribute("login"); //오브젝트 타입이기 때문에 형변환을 하여 맞춰준다.
		vo.setUidx(userVO.getUidx());
		reviewService.rvInsert(vo);
		
		
//		response.setContentType("text/html; charset=UTF-8"); 
//		PrintWriter out = response.getWriter();
		/*
		 * out.append("<script>alert('리뷰작성이 정상적으로 완료되었습니다.');location.href='"+req.
		 * getContextPath()+"/mypage/info.do'</script>"); out.flush(); out.close();
		 */
		 
		return "redirect:/mypage/info.do";
		
	}
}
