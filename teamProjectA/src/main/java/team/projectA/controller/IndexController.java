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

import team.projectA.service.IndexService;
import team.projectA.service.UserService;
import team.projectA.util.DateUtil;
import team.projectA.vo.FestivalVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.TripVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET) //���� �� ����������.
	public String index(Locale locale, Model model, String fromDate, String toDate)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//날짜
		 if(fromDate == null || fromDate.equals(""))
		 {
			 fromDate = DateUtil.GetToday();
		 }
		 if(toDate == null || toDate.equals(""))
		 {
			 toDate = DateUtil.GetTomorrow();
		 }
		 
		model.addAttribute("fromDate",fromDate);
		model.addAttribute("toDate",toDate);
		
		//숙소추천 리스트
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<ReviewVO> list = indexService.popLodgingList();

		
		model.addAttribute("list",list);
		model.addAttribute("serverTime", formattedDate );
		
		
		//페스티발 리스트
		List<FestivalVO> festivalList = indexService.mainFestivalList();
		
		model.addAttribute("festivalList",festivalList);
		
		//인기 여행지 리스트
		List<TripVO> tripList = indexService.mainTripList();
		
		model.addAttribute("tripList",tripList);
		
		return "index/index";
	}
	
	@RequestMapping(value = "/index/index.do", method = RequestMethod.GET)  // index�������� �̵�
	public String backIndex(Locale locale, Model model, String fromDate, String toDate)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//날짜
		 if(fromDate == null || fromDate.equals(""))
		 {
			 fromDate = DateUtil.GetToday();
		 }
		 if(toDate == null || toDate.equals(""))
		 {
			 toDate = DateUtil.GetTomorrow();
		 }		 
		 
		 System.out.println("index날짜"+fromDate);
		 System.out.println("index날짜"+toDate);
		List<ReviewVO> list = indexService.popLodgingList2();

		
		model.addAttribute("list",list);
		model.addAttribute("fromDate",fromDate);
		model.addAttribute("toDate",toDate);
		
		//페스티발 리스트
		List<FestivalVO> festivalList = indexService.mainFestivalList();
		
		model.addAttribute("festivalList",festivalList);
				
		//인기 여행지 리스트
		List<TripVO> tripList = indexService.mainTripList();
		
		model.addAttribute("tripList",tripList);
		
		return "index/index";
	}
	
	@RequestMapping(value = "/index/festivalInfo.do", method = RequestMethod.GET)  // index�������� �̵�
	public String indexFestivalInfo(int ftidx, Model model)throws Exception {
		
			FestivalVO vo = indexService.mainFestivalPage(ftidx);
			model.addAttribute("vo",vo);
			
		return "index/MainFestivalInfo";
	}
	@RequestMapping(value = "/index/tripInfo.do", method = RequestMethod.GET)  // index�������� �̵�
	public String indexTripInfo(int tidx, Model model)throws Exception {
		
			TripVO vo = indexService.mainTripPage(tidx);
			model.addAttribute("vo",vo);
			
		return "index/MainTripInfo";
	}
}
