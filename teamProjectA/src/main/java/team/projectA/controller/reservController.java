package team.projectA.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import team.projectA.service.LodgingService;
import team.projectA.service.ReservService;
import team.projectA.service.UserService;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;


@Controller
public class reservController {
	
	private static final Logger logger = LoggerFactory.getLogger(reservController.class);
	
	@Autowired
	private LodgingService lodgingService;
	@Autowired
	private ReservService reservService;
	 
	
	@RequestMapping(value = "/reserv/reserv.do", method = RequestMethod.GET)
	public String reserv(Model model,int ridx, HttpServletRequest req) {
		
				
		RoomVO rvo = lodgingService.selectRoom(ridx);
		model.addAttribute("rvo", rvo);
		
		
		
		HttpSession session = req.getSession();
		
		RoomVO room = lodgingService.selectRoom(ridx);
		
	
		session.setAttribute("room", room);
		
		return "reservpage/reserv";
	}
	@ResponseBody
	@RequestMapping(value = "/reserv/reserv_pay.do", method = RequestMethod.POST)
	public String reserv_pay(String merchant_uid, int ridx,HttpServletResponse response, HttpServletRequest req)throws Exception {
		
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO)session.getAttribute("login");
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("merchant_uid", merchant_uid); //�����ȣ
		hm.put("ridx", ridx);
		hm.put("uidx", userVO.getUidx());
		
		
		
		int vo = reservService.reservInsert(hm);
		String result = Integer.toString(vo);
		
		
		  
		  
		return result;
	}
	
}
