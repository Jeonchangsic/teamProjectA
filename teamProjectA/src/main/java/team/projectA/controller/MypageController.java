package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
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
import team.projectA.service.UserService;
import team.projectA.vo.Criteria;
import team.projectA.vo.PageMaker;
import team.projectA.vo.ReservVO;
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
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	//���೻�� ����Ʈ ��� �˻�
	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public String mypage(@ModelAttribute("scri") SearchCriteria scri, Criteria cri, Model model,HttpServletRequest req/*,ReservVO vo*/)throws Exception {
		
		/*
		 * HttpSession session = req.getSession(); UserVO userVO =
		 * (UserVO)session.getAttribute("login"); //������Ʈ Ÿ���̱� ������ ����ȯ�� �Ͽ� �����ش�.
		 * vo.setUidx(userVO.getUidx());
		 */
		
		List<ReservVO> list = null; 
		list = mypageService.listSearch(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		//pageMaker.setTotalCount(mypageService.reserv_count());
		pageMaker.setTotalCount(mypageService.countSearch(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "mypage/mypage";
	}
	
	//���೻�� �˻�
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
	

	//��й�ȣ ����
  @RequestMapping(value="pwModify.do", method = RequestMethod.POST) 
  public void pwModify(HttpSession session, UserVO vo, HttpServletRequest req, HttpServletResponse response) throws Exception{
	  
	  	int result = mypageService.changePw(vo); 
	  	
	  	if(result >0) {
	  	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<script>alert('��й�ȣ ������ �Ϸ�Ǿ����ϴ�. ����� ��й�ȣ�� �ٽ� �α��� ���ּ���.');location.href='"+req.getContextPath()+"/index/index.do'</script>"); 
		out.flush();
		out.close();
		session.invalidate(); //�α׾ƿ�ó��.
	  	}
  }
  
  
  //ȸ��Ż�� �������� �̵�
  @RequestMapping(value="/userDt.do", method = RequestMethod.GET)
  public void userDt() {  
	  
	  }
  
  
  //ȸ��Ż�� �ϱ�
  @RequestMapping(value="/userDt.do", method = RequestMethod.POST)
  public String userDt(HttpSession session, UserVO vo, RedirectAttributes rttr,HttpServletRequest req,HttpServletResponse response) throws Exception{
	  UserVO user = (UserVO)session.getAttribute("login");
	  
	  String oldPass = user.getUserPassword(); //�α����� ���� ��й�ȣ���� ������. 
	  String newPass = vo.getUserPassword();  //���� ������ ��й�ȣ �޴� input�� ���� ������
	  
	  if(!(oldPass.equals(newPass))) {
		  rttr.addFlashAttribute("msg",false);
		  return "redirect:/mypage/userDt.do";
	  }else {
	  
	  userService.userDt(vo);
	  
	  response.setContentType("text/html; charset=UTF-8");
	  PrintWriter out = response.getWriter();
	  out.append("<script>alert('ȸ��Ż�� ���������� ����Ǿ����ϴ�.');location.href='"+req.getContextPath()+"/index/index.do'</script>");
	  out.flush();
	  out.close();
	  session.invalidate();
	  
	  return ""; //printWriter append�� ����ؼ� alert�� ���� ������ location.href�� ������ �̵��� ���Ѿ��Ѵ�. �̶� �޼ҵ� �ڷ����� void�� �����ؾ��ϰ� returnŸ���� ������ϴµ� �̸� �����ϱ����� ������ ���ڷ� �Ͽ���.
  }
  }
  
}
