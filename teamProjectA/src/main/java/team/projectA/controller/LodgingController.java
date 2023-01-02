package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import team.projectA.service.LodgingService;
import team.projectA.vo.Criteria;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.PageMaker;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;
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
	public String list_gh(Model model, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men) {
		
/*		 List<LodgingVO> list1= lodgingService.selectList1("GH");		 
		 List<RoomVO> list2= lodgingService.selectList2(gubun);		 
		 model.addAttribute("list1",list1); 
		 model.addAttribute("list2",list2);
*/
		 List<Map<String,Object>> list = lodgingService.selectLodgingList("GH", type, area, rvo, linvo, rinvo, fromDate, toDate, men);
		 model.addAttribute("list",list);
		 model.addAttribute("type", type);
		 model.addAttribute("area", area);
		 model.addAttribute("rvo", rvo);
		model.addAttribute("linvo", linvo);
		model.addAttribute("rinvo", rinvo);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("men", men);
		 
		return "lodging/lodgingList_gh"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_hotel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_hotel(Model model, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men) {
		
		List<Map<String,Object>> list = lodgingService.selectLodgingList("호텔", type, area, rvo, linvo, rinvo, fromDate, toDate, men);
		model.addAttribute("list",list);
		model.addAttribute("type", type);
		model.addAttribute("area", area);
		model.addAttribute("rvo", rvo); // model에 담는 이유 : requestAttribute에 담는건데 이엘로 꺼내쓰기 위해
		model.addAttribute("linvo", linvo);
		model.addAttribute("rinvo", rinvo);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("men", men);
		
		return "lodging/lodgingList_hotel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_motel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_motel(Model model, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men) {

		List<Map<String,Object>> list = lodgingService.selectLodgingList("모텔", type, area, rvo, linvo, rinvo, fromDate, toDate, men);
		model.addAttribute("list",list);
		model.addAttribute("type", type);
		model.addAttribute("area", area);
		model.addAttribute("rvo", rvo);
		model.addAttribute("linvo", linvo);
		model.addAttribute("rinvo", rinvo);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("men", men);
		
		return "lodging/lodgingList_motel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_villa.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_villa(Model model, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men) {

		List<Map<String,Object>> list = lodgingService.selectLodgingList("펜션/풀빌라", type, area, rvo, linvo, rinvo, fromDate, toDate, men);
		model.addAttribute("list",list);
		model.addAttribute("type", type);
		model.addAttribute("area", area);
		model.addAttribute("rvo", rvo);
		model.addAttribute("linvo", linvo);
		model.addAttribute("rinvo", rinvo);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("men", men);
		
		return "lodging/lodgingList_villa"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_search.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_search(@ModelAttribute("scri") SearchCriteria scri, Model model, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men)throws Exception {
		
		
		/*
		 * System.out.println("keyword:"+ scri.getKeyword());
		 * System.out.println("stype:"+scri.getSearchType());
		 */
		
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("type", type);
		hm.put("area", area);
		hm.put("fromDate", fromDate);
		hm.put("toDate", toDate);
		hm.put("men", men);
		hm.put("keyword", scri.getKeyword());
		hm.put("searchType", scri.getSearchType());
		hm.put("bedArr", rvo.getBedArr());
		hm.put("roomspa", rinvo.getRoomspa());
		hm.put("wifi", rinvo.getWifi());
		hm.put("tv", rinvo.getTv());
		hm.put("refri", rinvo.getRefri());
		hm.put("bath", rinvo.getBath());
		hm.put("iron", rinvo.getIron());
		hm.put("minibar", rinvo.getMinibar());
		hm.put("bathitem", rinvo.getBathitem());
		hm.put("aircon", rinvo.getAircon());
		hm.put("shower", rinvo.getShower());
		hm.put("dryer", rinvo.getDryer());
		hm.put("ricecooker", rinvo.getRicecooker());
		hm.put("fitness", linvo.getFitness());
		hm.put("sauna", linvo.getSauna());
		hm.put("restaurant", linvo.getRestaurant());
		hm.put("lounge", linvo.getLounge());
		hm.put("bbq", linvo.getBbq());
		hm.put("publicspa", linvo.getPublicspa());
		hm.put("seminar", linvo.getSeminar());
		hm.put("singing", linvo.getSinging());
		hm.put("washingmachine", linvo.getWashingmachine());
		hm.put("dehydrator", linvo.getDehydrator());
		hm.put("cooking", linvo.getCooking());
		hm.put("spa", linvo.getSpa());
		hm.put("pool", linvo.getPool());
		hm.put("golf", linvo.getGolf());
		hm.put("elevator", linvo.getElevator());
		hm.put("pc", linvo.getPc());
		hm.put("cafe", linvo.getCafe());
		hm.put("footvolleyball", linvo.getFootvolleyball());
		hm.put("store", linvo.getStore());
		hm.put("dining", linvo.getDining());
		hm.put("dryer", linvo.getDryer());
		hm.put("parking", linvo.getParking());
		hm.put("publicshower", linvo.getPublicshower());
		hm.put("ski", linvo.getSki());
		hm.put("pickup", linvo.getPickup());
		hm.put("printer", linvo.getPrinter());
		hm.put("locker", linvo.getLocker());
		hm.put("breakfast", linvo.getBreakfast());
		hm.put("valetparking", linvo.getValetparking());
		hm.put("dog", linvo.getDog());
		hm.put("inroomcooking", linvo.getInroomcooking());
		hm.put("keepluggage", linvo.getKeepluggage());
		hm.put("freeparking", linvo.getFreeparking());
		hm.put("inroomsmoking", linvo.getInroomsmoking());
		hm.put("nosmoking", linvo.getNosmoking());
		hm.put("creditcard", linvo.getCreditcard());
		
		
		
		List<Map<String,Object>> List = lodgingService.listSearch(hm);
			/* System.out.println("Ȯ��"+roomList.get(0).getLodgingname()); */
		 model.addAttribute("type",type);
		 model.addAttribute("area", area);
		 model.addAttribute("rvo", rvo);
		 model.addAttribute("linvo", linvo);
		 model.addAttribute("rinvo", rinvo);
		 model.addAttribute("fromDate", fromDate);
		 model.addAttribute("toDate", toDate);
		 model.addAttribute("men", men);
		 model.addAttribute("list",List);
		 model.addAttribute("searchType",scri.getSearchType());
		 model.addAttribute("keyword", scri.getKeyword());
		/*
		 * List<RoomVO> list = lodgingService.selectListSearch(type);// listSearch(scri)
		 * model.addAttribute("list",list);
		 */
		
		return "lodging/lodgingList_search"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
//	@RequestMapping(value = "/lodgingList_filter.do", method = RequestMethod.POST)
//	public void list_filter(Model model, HttpServletRequest req) throws Exception {
//		
//		String[] arr = req.getParameterValues("roomin");
//		model.addAttribute("arr", arr);
//		
//	}
	
	@RequestMapping(value = "/lodgingView.do", method = RequestMethod.GET)
	public String lodgingView(int lidx, Model model, HttpServletRequest req, String fromDate, String toDate, String men, @ModelAttribute("cri") Criteria cri, String page) throws Exception {
			
		Map<String,Object> map = lodgingService.selectLodging(lidx);
		
		List<RoominVO> list = lodgingService.selectRoomList(lidx, men);
		
		//<review paging
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lodgingService.RVCount(lidx));
		
		List<ReviewVO> list2 = null;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lidx", lidx);
		hm.put("rowStart", cri.getRowStart());
		hm.put("rowEnd", cri.getRowEnd());
		
		list2 = lodgingService.selectReview(hm);
		
		ReviewVO rvvo = lodgingService.selectLodgingRV(lidx);
		//>
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("select", page);
		model.addAttribute("rvvo", rvvo);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("men", men);
		System.out.println("Ddd"+list.get(1).getRefri());
		//세션에 담기
		HttpSession session = req.getSession();
		
		Map<String,Object> lodging = lodgingService.selectLodging(lidx);
		
		session.setAttribute("lodging", lodging);
		
		
		return "lodging/lodgingView"; 
	}
	





}
