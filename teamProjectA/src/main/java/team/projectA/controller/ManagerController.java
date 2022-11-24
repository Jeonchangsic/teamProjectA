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
import org.springframework.web.bind.annotation.RequestParam;

import team.projectA.service.UserService;
import team.projectA.vo.PagingVO;
import team.projectA.vo.UserVO;

@RequestMapping(value="/manager")
@Controller
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private UserService userService;
	@RequestMapping(value = "/managerUser.do", method = RequestMethod.GET)
	public String user(Model model,UserVO vo , PagingVO vo1 ,UserVO vo2
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){
			
//	int total = userService.countUser(vo2);
//		if(nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} else if (nowPage == null) {
//			nowPage= "1";
//		}else if (cntPerPage == null) {
//			cntPerPage = "5";
//		}
//		vo1 = new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
//		model.addAttribute("Paging",vo1);
//		model.addAttribute("viewAll",userService.selectUserList(vo1));
		
		List<UserVO> list = userService.userList(vo);
		model.addAttribute("list",list);
		
		
		return "manager/managerUser";
	
	}
	@RequestMapping(value = "/managerRoom.do", method = RequestMethod.GET)
	public String Room(Locale locale, Model model) {
		
		
		return "manager/managerRoom";
	}
	@RequestMapping(value = "/managerReview.do", method = RequestMethod.GET)
	public String Review(Locale locale, Model model) {
	
		
		return "manager/managerReview";
	}
}
