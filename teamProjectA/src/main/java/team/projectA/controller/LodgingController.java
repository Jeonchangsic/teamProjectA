package team.projectA.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/lodging") //이 controller의 url은 반드시 board로 시작함
@Controller //객체로 만들어줌
public class LodgingController {   
	  
	private static final Logger logger = LoggerFactory.getLogger(LodgingController.class);
	
	@RequestMapping(value = "/lodgingList_gh.do", method = RequestMethod.GET) // value : 가상경로  // "/":메인페이지(웰컴파일)
	public String list_gh(Locale locale, Model model) {

		return "lodging/lodgingList_gh"; //경로바뀌면 여기서(servlet-context.xml에 써있는 기본경로를 기반으로) 추가 경로만 써주면 됨 ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_hotel.do", method = RequestMethod.GET) // value : 가상경로  // "/":메인페이지(웰컴파일)
	public String list_hotel(Locale locale, Model model) {

		return "lodging/lodgingList_hotel"; //경로바뀌면 여기서(servlet-context.xml에 써있는 기본경로를 기반으로) 추가 경로만 써주면 됨 ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_motel.do", method = RequestMethod.GET) // value : 가상경로  // "/":메인페이지(웰컴파일)
	public String list_motel(Locale locale, Model model) {

		return "lodging/lodgingList_motel"; //경로바뀌면 여기서(servlet-context.xml에 써있는 기본경로를 기반으로) 추가 경로만 써주면 됨 ex) main/home
	}
	 
	@RequestMapping(value = "/lodgingList_villa.do", method = RequestMethod.GET) // value : 가상경로  // "/":메인페이지(웰컴파일)
	public String list_villa(Locale locale, Model model) {

		return "lodging/lodgingList_villa"; //경로바뀌면 여기서(servlet-context.xml에 써있는 기본경로를 기반으로) 추가 경로만 써주면 됨 ex) main/home
	}
	
	@RequestMapping(value = "/lodgingView.do", method = RequestMethod.GET) // value : 가상경로  // "/":메인페이지(웰컴파일)
	public String lodgingView(Locale locale, Model model) {

		return "lodging/lodgingView"; //경로바뀌면 여기서(servlet-context.xml에 써있는 기본경로를 기반으로) 추가 경로만 써주면 됨 ex) main/home
	}





}
