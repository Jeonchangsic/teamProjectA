package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.projectA.service.LodgingService;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

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
	public String list_gh(Locale locale, RoomVO vo, Model model) {
		
		List<LodgingVO> list1= lodgingService.selectList1("GH");
		
		List<RoomVO> list2= lodgingService.selectList2(vo);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		return "lodging/lodgingList_gh"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_hotel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_hotel(Locale locale, RoomVO vo, Model model) {

		List<LodgingVO> list1= lodgingService.selectList1("ȣ��");
		
		List<RoomVO> list2= lodgingService.selectList2(vo);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		return "lodging/lodgingList_hotel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_motel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_motel(Locale locale, RoomVO vo, Model model) {

		List<LodgingVO> list1= lodgingService.selectList1("����");
		
		List<RoomVO> list2= lodgingService.selectList2(vo);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		return "lodging/lodgingList_motel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_villa.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_villa(Locale locale, RoomVO vo, Model model) {

		List<LodgingVO> list1= lodgingService.selectList1("���/Ǯ����");
		
		List<RoomVO> list2= lodgingService.selectList2(vo);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		return "lodging/lodgingList_villa"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingView.do", method = RequestMethod.GET)
	public String lodgingView(Locale locale, String lidx, Model model) {
			
		LodgingVO vo = lodgingService.selectLodging(lidx);
		
		List<RoomVO> list = lodgingService.selectRoomList(lidx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		return "lodging/lodgingView"; 
	}





}
