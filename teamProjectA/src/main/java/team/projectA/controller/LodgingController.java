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
@RequestMapping(value="/lodging") //�� controller�� url�� �ݵ�� board�� ������
@Controller //��ü�� �������
public class LodgingController {   
	  
	private static final Logger logger = LoggerFactory.getLogger(LodgingController.class);
	
	@RequestMapping(value = "/lodgingList_gh.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_gh(Locale locale, Model model) {

		return "lodging/lodgingList_gh"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_hotel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_hotel(Locale locale, Model model) {

		return "lodging/lodgingList_hotel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingList_motel.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_motel(Locale locale, Model model) {

		return "lodging/lodgingList_motel"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	 
	@RequestMapping(value = "/lodgingList_villa.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String list_villa(Locale locale, Model model) {

		return "lodging/lodgingList_villa"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}
	
	@RequestMapping(value = "/lodgingView.do", method = RequestMethod.GET) // value : ������  // "/":����������(��������)
	public String lodgingView(Locale locale, Model model) {

		return "lodging/lodgingView"; //��ιٲ�� ���⼭(servlet-context.xml�� ���ִ� �⺻��θ� �������) �߰� ��θ� ���ָ� �� ex) main/home
	}





}
