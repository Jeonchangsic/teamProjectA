package team.projectA.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import team.projectA.service.SellerService;
import team.projectA.vo.LodgingVO;

import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/seller")
@Controller
public class SellerController {
	 	
	@Autowired
	private SellerService sellerService;

	@Resource(name="uploadPath")
	private String uploadPath;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @param sellerService 
	 */
	
	//媛쒖씤�젙蹂�, �닕�냼�젙蹂�
	@RequestMapping(value = "/sellerInfo.do", method = RequestMethod.GET)
	public String sellerInfo(Locale locale, Model model,  HttpServletRequest req) {

		  //session 爰쇰궡湲� uidx媛� 媛�吏�怨� �엳�뒗 媛쒖씤,�닕�냼 �젙蹂대�� 爰쇰궪寃껋씠湲� �븣臾몄뿉 
		  HttpSession session = req.getSession(); 								//�꽭�뀡 遺덈윭�깂
		  UserVO login = (UserVO) session.getAttribute("login"); 				//�꽭�뀡�뿉 ���옣�릺�뼱�엳�뜕 login �젙蹂� 媛�吏�怨� �샂 
		  LodgingVO lodging = sellerService.SellerOne(login.getUidx());			//SellerOne�뿉 session�뿉 ���옣�릺�뼱�엳�뜕 uidx瑜� 留ㅺ컻蹂��닔濡� �꽔�쓬
		  	  
		  model.addAttribute("lodging",lodging);								//model�뿉 �꽔�쑝硫� �솕硫댁뿉 肉뚮┫�닔 �엳�쓬
		
		return "seller/sellerInfo";
	}
	
    //媛쒖씤�젙蹂� �닔�젙
	@RequestMapping (value ="/sellerInfo1.do", method = RequestMethod.POST)
	public String sellerInfo(UserVO vo, HttpServletRequest req)throws Exception{
		 
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
		vo.setUidx(login.getUidx());
			
		sellerService.sellerUpdate(vo);
		
		return "redirect: sellerInfo.do";
			
	}

	//�닕�냼�젙蹂� �닔�젙
	@RequestMapping (value ="/sellerInfo2.do", method = RequestMethod.POST)
	public String sellerInfo(LodgingVO vo, HttpServletRequest req)throws Exception{
		
	
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
		vo.setUidx(login.getUidx());
	
		sellerService.sellerUpdate2(vo);
		
		return "redirect: sellerInfo.do";
		
	}

		
		
	//臾몄쓽 湲� 由ъ뒪�듃
    @RequestMapping(value = "/sellerInquire.do", method = RequestMethod.GET)
    public String sellerInquire(Model model,HttpServletRequest req){
 
                                                                        
        HttpSession session = req.getSession();                                 
        UserVO login = (UserVO) session.getAttribute("login");
        List<QnaVO> qnaList = sellerService.qnaList(login.getUidx()); 

        model.addAttribute("qnaList", qnaList);
                
        return "seller/sellerInquire";
    }
    
    
	//臾몄쓽 湲� 蹂닿린
	@RequestMapping(value="/sellerInquireView.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int QnA_idx) {
				
			QnaVO vo = (QnaVO)sellerService.qnaOne(QnA_idx);
			model.addAttribute("vo",vo);
			
		
		
		return "seller/sellerInquireView";
	
		
		
	}
	//臾몄쓽�벐湲�
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.GET)
	public String sellerInquireWrite(Locale locale, Model model) {
			
		return "seller/sellerInquireWrite";
	}
	
	
	//臾몄쓽�벐湲�
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.POST)
	public String sellerInquireWrite(QnaVO vo, HttpServletRequest req, HttpServletResponse response)throws Exception {
		
		
		HttpSession session = req.getSession();		
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setUidx(login.getUidx());
		
		sellerService.qnaInsert(vo);	
		
		return "redirect: sellerInquire.do";	

	}
	
	//媛앹떎�젙蹂�
	@RequestMapping(value = "/sellerRegi.do", method = RequestMethod.GET)
	public String Regi(Locale locale, Model model, HttpServletRequest req, RoomVO vo) {
		
	
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");	
		List<RoomVO> roomlist = sellerService.roomlist(login.getUidx());
		
		model.addAttribute("roomlist", roomlist);
		
		
		return "seller/sellerRegi";
	}
	
	//媛앹떎�궘�젣
	@RequestMapping(value = "/sellerRegi2.do", method = RequestMethod.GET)
	public String Regi2(Locale locale, Model model, int ridx) {

		 sellerService.roomdel(ridx);

		
		return "redirect:/seller/sellerRegi.do";
		
	}
	
	
	//roomup 
	@RequestMapping(value = "/sellerRoomup1.do", method = RequestMethod.GET)
	public String roomup1(Locale locale, Model model, HttpServletRequest req, LodgingVO vo) {
		
			HttpSession session = req.getSession();
			UserVO login = (UserVO)session.getAttribute("login");	
			LodgingVO lidxone = sellerService.lidxone(login.getUidx());


			model.addAttribute("lidxone",lidxone);
		
	
		
		return "seller/sellerRoomup1";
	}
	
	
	@RequestMapping(value="/sellerRoomup1.do", method = RequestMethod.POST)
	public String roomup1(RoomVO vo, MultipartFile file, RoominVO room) throws Exception {
			
		String fileRealName = file.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
		long size = file.getSize(); //�뙆�씪 �궗�씠利�
		
		System.out.println("�뙆�씪紐� : "  + fileRealName);
		System.out.println("�슜�웾�겕湲�(byte) : " + size);
		//�꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽  �솗�옣�옄 紐낆쓣 援ы븿
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "D:\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\teamProjectA\\resources\\images";
		
		
		/*
		  �뙆�씪 �뾽濡쒕뱶�떆 �뙆�씪紐낆씠 �룞�씪�븳 �뙆�씪�씠 �씠誘� 議댁옱�븷 �닔�룄 �엳怨� �궗�슜�옄媛� 
		  �뾽濡쒕뱶 �븯�뒗 �뙆�씪紐낆씠 �뼵�뼱 �씠�쇅�쓽 �뼵�뼱濡� �릺�뼱�엳�쓣 �닔 �엳�뒿�땲�떎. 
		  ���씤�뼱瑜� 吏��썝�븯吏� �븡�뒗 �솚寃쎌뿉�꽌�뒗 �젙�궛 �룞�옉�씠 �릺吏� �븡�뒿�땲�떎.(由щ늼�뒪媛� ���몴�쟻�씤 �삁�떆)
		  怨좎쑀�븳 �옖�뜕 臾몄옄瑜� �넻�빐 db�� �꽌踰꾩뿉 ���옣�븷 �뙆�씪紐낆쓣 �깉濡�寃� 留뚮뱾�뼱 以��떎.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("�깮�꽦�맂 怨좎쑀臾몄옄�뿴" + uniqueName);
		System.out.println("�솗�옣�옄紐�" + fileExtension);
		
		
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid �쟻�슜 �쟾
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // �쟻�슜 �썑
		try {
			file.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		int maxridx = sellerService.roomup(vo);
		room.setRidx(maxridx);
		int value = sellerService.roomInCh(room);
System.out.println("asasavalue"+value);
		


		
		return "redirect: sellerRoomup3.do";
	}
		
	
	@RequestMapping(value = "/sellerRoomup2.do", method = RequestMethod.GET)
	public String roomup2(Locale locale, Model model) {
		
	
		
		return "seller/sellerRoomup2";
	}
	
	@RequestMapping(value = "/sellerRoomup3.do", method = RequestMethod.GET)
	public String roomup3(Locale locale, Model model) {
		
	
		
		return "seller/sellerRoomup3";
	}
	

	
	@RequestMapping(value = "/sellerLodgingModify.do", method = RequestMethod.GET)
	public String sellerLodgingModify(Locale locale, Model model) {
		
		
		
	
		return "seller/sellerLodgingModify";
	}
	
	@RequestMapping(value="/sellerLodgingUp.do", method=RequestMethod.GET)
	public String sellerLodgingUp(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		model.addAttribute("vo", login);		
		
		return "seller/sellerLodgingUp";
	}
	
	@RequestMapping(value="/sellerLodgingUp.do", method=RequestMethod.POST)
	public String sellerLodgingUp(LodgingVO vo, HttpServletRequest req) {
		
		sellerService.lodgingUp(vo);
		sellerService.waiting(vo);
		
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		login.setLodging("Waiting");
		
		session.setAttribute("login", login);

		return "redirect:sellerInfo.do";
	}
	

}
