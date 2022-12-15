package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import team.projectA.service.LodgingService;
import team.projectA.service.ManagerService;
import team.projectA.service.ReservService;
import team.projectA.service.UserService;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;

@RequestMapping(value="/manager")
@Controller
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	@Autowired
	private LodgingService lodgingService;
	@Autowired
	private ReservService reservService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private UserService userService;
	@RequestMapping(value = "/managerUser.do", method = RequestMethod.GET)
	public String user(Model model,UserVO vo,ReservVO vo1 ) {
		List<ReservVO> list1 = managerService.reservlist(vo1);
		List<UserVO> list = userService.userList(vo);
		model.addAttribute("list",list);
		model.addAttribute("list1",list1);
		
		return "manager/managerUser";
	
	}
	@RequestMapping(value = "/managerRoom.do", method = RequestMethod.GET)
	public String Room(Locale locale, Model model) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//���ҿ�û���
		List<LodgingVO> requestList = managerService.requestList();
		model.addAttribute("requestList", requestList);
		
		//���� �α���õ
		List<LodgingVO> lodgingCategory = null;
		lodgingCategory = managerService.lodgingCategory();
		model.addAttribute("lodgingCategory",lodgingCategory);
		
		//
		
		return "manager/managerRoom";
	}
	//���ҽ���
	@RequestMapping(value="/requestApproval.do", method = RequestMethod.POST)
	public String requestApproval(int uidx) {
		
		managerService.approval(uidx);
		
		return "redirect:managerRoom.do";
	}
	//���ҽ��ΰź�
	@RequestMapping(value="/requestDel.do", method = RequestMethod.POST)
	public String requestDel(int uidx, int lidx) {
		
		managerService.requestDel(lidx);
		managerService.requestN(uidx);
		
		return "redirect:managerRoom.do";
	}
	
	@RequestMapping(value = "/managerReview.do", method = RequestMethod.GET)
	public String Review(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		return "manager/managerReview";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/roomCategoryChange.do", method= RequestMethod.GET)
	public List<RoomVO> lodgingCategory(@RequestParam("lidx") int lidx){
		/* System.out.println("data:"+lidx); */  
		List<RoomVO> rlist = (List<RoomVO>)managerService.selectRoomList(lidx);
		
		/* System.out.println("rlist:"+rlist); */
		/* System.out.println("data:"+rlist.get(0).getRidx()); */
		
		return rlist;
	}
}
