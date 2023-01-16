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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.projectA.service.MypageService;
import team.projectA.service.ReservService;
import team.projectA.service.UserService;
import team.projectA.vo.Criteria;
import team.projectA.vo.Criteria2;
import team.projectA.vo.PageMaker;
import team.projectA.vo.PageMaker2;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/mypage")
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private UserService userService;
	@Autowired
	private ReservService reservService;
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	
	//마이페이지
	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public String mypage(Model model,HttpServletRequest req)throws Exception {
		
		//마이페이지 회원정보
		  HttpSession session = req.getSession();
		  UserVO userVO = (UserVO)session.getAttribute("login"); //오브젝트 타입이기 때문에 형변환을 하여 맞춰준다.
		 
		  
		return "mypage/mypage";
	}
	//마이페이지 예약내역
	@RequestMapping(value = "/reservList.do", method = RequestMethod.GET)
	public String mypage_reservList(@ModelAttribute("cri2") Criteria2 cri2, Model model,HttpServletRequest req)throws Exception {
		

		  HttpSession session = req.getSession();
		  UserVO userVO = (UserVO)session.getAttribute("login"); //오브젝트 타입이기 때문에 형변환을 하여 맞춰준다.
		 
		//마이페이지 예약내역리스트,페이징
		  List<ReservVO> list = null; 
		  
		  HashMap<String,Object> hm = new HashMap<String,Object>();
		  hm.put("uidx", userVO.getUidx());
		  hm.put("rowStart2", cri2.getRowStart2());
		  hm.put("rowEnd2", cri2.getRowEnd2());
		  
		  list = mypageService.listPage(hm);
		  
		  model.addAttribute("list",list);
		  
		  
		  PageMaker2 pageMaker2 = new PageMaker2();
		  pageMaker2.setCri2(cri2);
		  pageMaker2.setTotalCount2(mypageService.reserv_count());
		  
		  model.addAttribute("pageMaker2",pageMaker2);
		  

		Date now = new Date();
		model.addAttribute("now",now);
		
		
		return "mypage/mypage_reservList";
	}
		
	//마이페이지 리뷰내역
	@RequestMapping(value = "/reviewList.do", method = RequestMethod.GET)
	public String mypage_reviewList(@ModelAttribute("cri2") Criteria2 cri2, Model model,HttpServletRequest req)throws Exception {
		

		  HttpSession session = req.getSession();
		  UserVO userVO = (UserVO)session.getAttribute("login"); //오브젝트 타입이기 때문에 형변환을 하여 맞춰준다.
		 
		//마이페이지 리뷰내역,페이징
		
		 List<ReviewVO> reviewList = null;
		  
		 HashMap<String,Object> hm2 = new HashMap<String,Object>();
			hm2.put("uidx", userVO.getUidx());
			hm2.put("rowStart2", cri2.getRowStart2());
			hm2.put("rowEnd2", cri2.getRowEnd2());
		  
		  
		  reviewList = mypageService.reviewList(hm2);
		  
		  model.addAttribute("reviewList",reviewList);
		  
		  PageMaker2 pageMaker2 = new PageMaker2();
		  pageMaker2.setCri2(cri2);
		  pageMaker2.setTotalCount2(mypageService.review_count());
		  model.addAttribute("pageMaker2",pageMaker2);
		  
		//마이페이지 
		return "mypage/mypage_reviewList";
	}
		
	
	
  
  
  //회원탈퇴 페이지로 이동
  @RequestMapping(value="/userDt.do", method = RequestMethod.GET)
  public void userDt() {  
	  
	  }
  
  
  //회원탈퇴 하기
  @RequestMapping(value="/userDt.do", method = RequestMethod.POST)
  public String userDt(HttpSession session, UserVO vo, RedirectAttributes rttr,HttpServletRequest req,HttpServletResponse response) throws Exception{
	  UserVO user = (UserVO)session.getAttribute("login");
	  
	  String oldPass = user.getUserPassword(); //로그인할 때의 비밀번호값을 가져옴. 
	  String newPass = vo.getUserPassword();  //입력받은 비밀번호  input의 값을 가져옴
	  PrintWriter out = response.getWriter();
	  
	  if(!(oldPass.equals(newPass))) {
		  response.setContentType("text/html; charset=UTF-8");
		  out.append("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		  out.flush();
		  out.close();
		  return "";
	  }else {
	  userService.reviewDt(vo);
	  userService.reservDt(vo);
	  userService.userDt(vo);
	  
	  response.setContentType("text/html; charset=UTF-8");
	  out.append("<script>alert('회원탈퇴가 정상적으로 진행되었습니다.'); opener.location.href='"+req.getContextPath()+"/index/index.do'; window.close();</script>");
	  out.flush();
	  out.close();
	  session.invalidate();
	  
	  return ""; //printWriter append를 사용해서 alert을 띄우면 무조건 location.href로 페이지 이동을 시켜야한다. 이때 메소드 자료형은 void로 변경해야하고 return타입은 없어야하는데 이를 방지하기위해 리턴을 빈문자로 하였다.
  }
  }
  
  //예약취소 팝업창
  @RequestMapping(value="/refundPop.do", method = RequestMethod.GET)
  public String refundPop(int uidx ,int ridx, String limagename,String startDate,String endDate,String reserv_num,Model model)throws Exception{
	  
	  HashMap<String,Object> hm = new HashMap<String,Object>();
	  hm.put("uidx", uidx);
	  hm.put("ridx", ridx);
	  hm.put("reserv_num", reserv_num);
	 ReservVO result = mypageService.reservListPop(hm);
	 
	 model.addAttribute("startDate",startDate);
	 model.addAttribute("endDate",endDate);
	 model.addAttribute("ridx",ridx);
	 model.addAttribute("result",result);
	 model.addAttribute("limagename",limagename);
	 return "mypage/refund"; 
  }
  
  //예약취소
  @RequestMapping(value="/refund.do", method = RequestMethod.POST)
  public String refund(String reserv_num,ReservVO rvo,UserVO vo,HttpSession session,RedirectAttributes rttr,HttpServletRequest req,HttpServletResponse response) throws Exception{
	  UserVO user = (UserVO)session.getAttribute("login");
	  
	  String oldPass = user.getUserPassword(); //로그인할 때의 비밀번호값을 가져옴.
	  String newPass = vo.getUserPassword();  //새로 입력한 비밀번호 받는 input의 값을 가져옴
	  PrintWriter out = response.getWriter();
	  
	  if(!(oldPass.equals(newPass))) {
		  response.setContentType("text/html; charset=UTF-8");
		  out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		  out.flush();
		  out.close();
		  return"";
	  }else {
	  
	  mypageService.reserv_refund(rvo);
	  response.setContentType("text/html; charset=UTF-8");
	  out.append("<script>alert('예약취소가 완료 되었습니다.'); opener.parent.location.reload(); window.close();</script>");
	  out.flush();
	  out.close();
	  
	  return ""; //printWriter append를 사용해서 alert을 띄우면 무조건 location.href로 페이지 이동을 시켜야한다. 이때 메소드 자료형은 void로 변경해야하고 return타입은 없어야하는데 이를 방지하기위해 리턴을 빈문자로 하였다.
	  }
  }
  //예약리스트 내역 삭제
  @RequestMapping(value="/reservListDt.do", method = RequestMethod.GET)
  public String reservListDt(int reserv_idx) {
	  
	  mypageService.reservListDt(reserv_idx);
	  
	  return "redirect:/mypage/reservList.do";
  }
  //리뷰 상세보기
  @RequestMapping(value="/reviewInfo.do", method = RequestMethod.GET)
  public String reviewInfo(int rvidx, String limagename, Model model,String startDate,String endDate,HttpServletResponse response)throws Exception{
	  	
		ReviewVO vo = mypageService.reviewList2(rvidx);
		model.addAttribute("vo",vo);
		model.addAttribute("limagename",limagename);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
	  return "review/reviewInfo"; 
  }
  //리뷰 삭제
  @RequestMapping(value="/reviewDt.do", method = RequestMethod.GET)
  public String reviewDt(int rvidx, Model model,HttpServletResponse response,HttpServletRequest req)throws Exception{
	  	PrintWriter out = response.getWriter();
		mypageService.reviewDt(rvidx);
		
		response.setContentType("text/html; charset=UTF-8");
		out.append("<script>alert('리뷰 삭제가 완료되었습니다.'); opener.parent.location.reload(); window.close();</script>");
		out.flush();
		out.close();
	  return ""; 
  }
}
