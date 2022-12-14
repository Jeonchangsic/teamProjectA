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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.projectA.service.MypageService;
import team.projectA.service.ReservService;
import team.projectA.service.UserService;
import team.projectA.vo.Criteria;
import team.projectA.vo.PageMaker;
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
	public String mypage(@ModelAttribute("scri") SearchCriteria scri, Model model,HttpServletRequest req)throws Exception {
		
		//마이페이지 회원정보
		  HttpSession session = req.getSession();
		  UserVO userVO = (UserVO)session.getAttribute("login"); //오브젝트 타입이기 때문에 형변환을 하여 맞춰준다.
		 
		//마이페이지 예약내역리스트,페이징
		  List<ReservVO> list = null; 
		  
		  PageMaker pageMaker = new PageMaker();
		  pageMaker.setCri(scri);
		  pageMaker.setTotalCount(mypageService.reserv_count());
		  
		 
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("uidx", userVO.getUidx());
		hm.put("rowStart", scri.getRowStart());
		hm.put("rowEnd", scri.getRowEnd());
		list = mypageService.listPage(hm);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker);
		
		//마이페이지 리뷰내역
		int uidx = userVO.getUidx();
		List<ReviewVO> reviewList = mypageService.reviewList(uidx);
		
		model.addAttribute("reviewList",reviewList);
		return "mypage/mypage";
	}
	
	//예약내역 검색
	/*
	 * @RequestMapping(value = "/listSearch", method = RequestMethod.GET) public
	 * void mypage(@ModelAttribute("scri") SearchCriteria scri, Model model)throws
	 * Exception {
	 * 
	 * 
	 * List<ReservVO> list = null; list = mypageService.listSearch(scri);
	 * model.addAttribute("list",list);
	 * 
	 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
	 * //pageMaker.setTotalCount(mypageService.reserv_count());
	 * pageMaker.setTotalCount(mypageService.countSearch(scri));
	 * model.addAttribute("pageMaker",pageMaker);
	 * 
	 * }
	 */
	

	//비밀번호 수정
  @RequestMapping(value="pwModify.do", method = RequestMethod.POST) 
  public void pwModify(HttpSession session, UserVO vo, HttpServletRequest req, HttpServletResponse response) throws Exception{
	  
	  	int result = mypageService.changePw(vo); 
	  	
	  	if(result >0) {
	  	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<script>alert('비밀번호 수정이 완료되었습니다. 변경된 비밀번호로 다시 로그인 해주세요.');location.href='"+req.getContextPath()+"/index/index.do'</script>"); 
		out.flush();
		out.close();
		session.invalidate(); //로그아웃처리.
	  	}
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
	  String newPass = vo.getUserPassword();  //새로 생성한 비밀번호 받는 input의 값을 가져옴
	  
	  if(!(oldPass.equals(newPass))) {
		  rttr.addFlashAttribute("msg",false);
		  return "redirect:/mypage/userDt.do";
	  }else {
	  
	  userService.userDt(vo);
	  
	  response.setContentType("text/html; charset=UTF-8");
	  PrintWriter out = response.getWriter();
	  out.append("<script>alert('회원탈퇴가 정상적으로 진행되었습니다.');location.href='"+req.getContextPath()+"/index/index.do'</script>");
	  out.flush();
	  out.close();
	  session.invalidate();
	  
	  return ""; //printWriter append를 사용해서 alert을 띄우면 무조건 location.href로 페이지 이동을 시켜야한다. 이때 메소드 자료형은 void로 변경해야하고 return타입은 없어야하는데 이를 방지하기위해 리턴을 빈문자로 하였다.
  }
  }
  
  //환불처리 팝업창
  @RequestMapping(value="/refundPop.do", method = RequestMethod.GET)
  public String refundPop(int uidx ,int ridx, Model model)throws Exception{
	  
	  HashMap<String,Integer> hm = new HashMap<String,Integer>();
	  hm.put("uidx", uidx);
	  hm.put("ridx", ridx);
	 ReservVO result = mypageService.reservListPop(hm);
	  
	 model.addAttribute("result",result);
	  return "mypage/refund"; 
  }
  
  //예약내역 지우기
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
	  out.append("<script>alert('예약취소가 완료 되었습니다.'); opener.parent.location.reload();window.close();</script>");
	  out.flush();
	  out.close();
	  
	  return ""; //printWriter append를 사용해서 alert을 띄우면 무조건 location.href로 페이지 이동을 시켜야한다. 이때 메소드 자료형은 void로 변경해야하고 return타입은 없어야하는데 이를 방지하기위해 리턴을 빈문자로 하였다.
  }
  }
  
  //리뷰 상세보기
  @RequestMapping(value="/reviewInfo.do", method = RequestMethod.GET)
  public String reviewInfo(int rvidx, Model model,HttpServletResponse response)throws Exception{
	  	
		ReviewVO vo = mypageService.reviewList2(rvidx);
		model.addAttribute("vo",vo);
	  return "review/reviewInfo"; 
  }
  
  @RequestMapping(value="/reviewDt.do", method = RequestMethod.GET)
  public String reviewDt(int rvidx, Model model,HttpServletResponse response,HttpServletRequest req)throws Exception{
	  	PrintWriter out = response.getWriter();
		mypageService.reviewDt(rvidx);
		
		response.setContentType("text/html; charset=UTF-8");
		out.append("<script>alert('리뷰 삭제가 완료되었습니다.');location.href='"+req.getContextPath()+"/mypage/info.do'</script>");
		out.flush();
		out.close();
	  return ""; 
  }
}
