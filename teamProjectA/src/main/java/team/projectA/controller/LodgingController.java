package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team.projectA.service.LodgingService;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/lodging") //�� controller�� url�� �ݵ�� board�� ������
@Controller //��ü�� �������
public class LodgingController {   
	  
	private static final Logger logger = LoggerFactory.getLogger(LodgingController.class);
	
	@Autowired
	private LodgingService lodgingService;
	
	@RequestMapping(value = "/lodgingList_gh.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_gh(Model model, String type, String area) {
		
/*		 List<LodgingVO> list1= lodgingService.selectList1("GH");		 
		 List<RoomVO> list2= lodgingService.selectList2(gubun);		 
		 model.addAttribute("list1",list1); 
		 model.addAttribute("list2",list2);
*/
		 List<RoomVO> list = lodgingService.selectLodgingList("GH", type);
		 model.addAttribute("list",list);
		 model.addAttribute("type", type);
		 model.addAttribute("area", area);
		 
		return "lodging/lodgingList_gh"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_hotel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_hotel(Model model, String type, String area) {

		List<RoomVO> list = lodgingService.selectLodgingList("ȣ��", type);
		model.addAttribute("list",list);
		model.addAttribute("type", type);
		model.addAttribute("area", area);
		 
		return "lodging/lodgingList_hotel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_motel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_motel(Model model, String type, String area) {

		List<RoomVO> list = lodgingService.selectLodgingList("����", type);
		model.addAttribute("list",list);
		model.addAttribute("type", type);
		model.addAttribute("area", area);
		
		return "lodging/lodgingList_motel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_villa.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_villa(Model model, String type, String area) {

		List<RoomVO> list = lodgingService.selectLodgingList("���/Ǯ����", type);
		model.addAttribute("list",list);
		model.addAttribute("type", type);
		model.addAttribute("area", area);
		
		return "lodging/lodgingList_villa"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_search.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_search(Model model, String type) {
		
		List<RoomVO> list = lodgingService.selectListSearch(type);
		model.addAttribute("list",list);
		
		return "lodging/lodgingList_search"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_filter.do")
	public String list_filter(Model model, HttpServletRequest req) {
		
		String[] arr = req.getParameterValues("roomin");
		model.addAttribute("arr", arr);
		
		return "";
	}
	
	@RequestMapping(value = "/lodgingView.do", method = RequestMethod.GET)
	public String lodgingView(String lidx, Model model, HttpServletRequest req) {
			
		LodgingVO vo = lodgingService.selectLodging(lidx);
		
		List<RoomVO> list = lodgingService.selectRoomList(lidx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		HttpSession session = req.getSession();
		
		LodgingVO lodging = lodgingService.selectLodging(lidx);
		
		session.setAttribute("lodging", lodging);
		
		
		return "lodging/lodgingView"; 
	}
	
	
	





}
