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

	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @param sellerService 
	 */
	
	//판매자정보
	@RequestMapping(value = "/sellerInfo.do", method = RequestMethod.GET)
	public String sellerInfo(Locale locale, Model model,  HttpServletRequest req) {

		  //uidx가 ?값인 사용자의 정보가 필요v
		  HttpSession session = req.getSession(); 								//session불러냄
		  UserVO login = (UserVO) session.getAttribute("login"); 				//session에 저장되어있는 login값 불러옴
		  LodgingVO lodging = sellerService.SellerOne(login.getUidx());			//SellerOne에 uidx저장
		  	  
		  model.addAttribute("lodging",lodging);								
		
		return "seller/sellerInfo";
	}
	
    //판매자 정보 수정 (개인정보)
	@RequestMapping (value ="/sellerInfo1.do", method = RequestMethod.POST)
	public String sellerInfo(UserVO vo, HttpServletRequest req)throws Exception{
  
		HttpSession session2 = req.getSession();
		UserVO login = (UserVO)session2.getAttribute("login");
		vo.setUidx(login.getUidx());
			
		sellerService.sellerUpdate(vo);

		return "redirect: sellerInfo.do";
			
	}

	//판매자 정보 수정 (숙소정보)
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
    
    
	//문의글 리스트
	@RequestMapping(value="/sellerInquireView.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int QnA_idx) {
				
			QnaVO vo = (QnaVO)sellerService.qnaOne(QnA_idx);
			model.addAttribute("vo",vo);
			
		
		
		return "seller/sellerInquireView";
	
		
		
	}
	//문의글 쓰기 get
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.GET)
	public String sellerInquireWrite(Locale locale, Model model) {
			
		return "seller/sellerInquireWrite";
	}
	
	
	//문의글 쓰기 post
	@RequestMapping(value = "/sellerInquireWrite.do", method = RequestMethod.POST)
	public String sellerInquireWrite(QnaVO vo, HttpServletRequest req, HttpServletResponse response)throws Exception {
		
		
		HttpSession session = req.getSession();		
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setUidx(login.getUidx());
		
		sellerService.qnaInsert(vo);	
		
		return "redirect: sellerInquire.do";	

	}
	
	//객실 리스트
	@RequestMapping(value = "/sellerRegi.do", method = RequestMethod.GET)
	public String Regi(Locale locale, Model model, HttpServletRequest req, RoomVO vo) {
		
	
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");	
		List<RoomVO> roomlist = sellerService.roomlist(login.getUidx());
		
		model.addAttribute("roomlist", roomlist);
		
		
		return "seller/sellerRegi";
	}
	
	//게시글 삭제 (redirect해야해서 가상경로 따로 설정함)
	@RequestMapping(value = "/sellerRegi2.do", method = RequestMethod.GET)
	public String Regi2(Locale locale, Model model, int ridx) {

		 sellerService.roomdel(ridx);

		
		return "redirect:/seller/sellerRegi.do";
		
	}
	
	
	//객실등록  
	@RequestMapping(value = "/sellerRoomup1.do", method = RequestMethod.GET)
	public String roomup1(Locale locale, Model model, HttpServletRequest req, LodgingVO vo) {
		
			HttpSession session = req.getSession();
			UserVO login = (UserVO)session.getAttribute("login");	
			LodgingVO lidxone = sellerService.lidxone(login.getUidx());


			model.addAttribute("lidxone",lidxone);
		
	
		
		return "seller/sellerRoomup1";
	}
	
	//객실등록
	@RequestMapping(value="/sellerRoomup1.do", method = RequestMethod.POST)
	public String roomup1(RoomVO vo, MultipartFile file, RoominVO room, HttpServletRequest req) throws Exception {
			
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "D:\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\teamProjectA\\resources\\images\\lodging_images";
		
		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setRimage1(uniqueName+fileExtension); //파일이름 + 확장자 vo 에 넣어줌 (db입력)
		int maxridx = sellerService.roomup(vo);		
		room.setRidx(maxridx);
		
		sellerService.roomInCh(room);
				
		return "redirect: sellerRoomup3.do";
	}
		
	//객실수정 정보
	@RequestMapping(value = "/sellerRoomup2.do", method = RequestMethod.GET)
	public String roomup2(Locale locale, Model model, int ridx) {
		
		RoominVO roomModify = sellerService.roomModiInfo(ridx);
		model.addAttribute("roomModify", roomModify);
		
		return "seller/sellerRoomup2";
	}
	
	//객실 수정
	@RequestMapping (value = "/sellerRoomup2.do", method = RequestMethod.POST)
	public String roomModify(Locale locale, Model model, MultipartFile file, HttpServletRequest req, RoomVO vo, RoominVO in) {

		 //새로운 이미지가 등록 되어있나 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  // 기존 이미지 삭제
			  new File(req.getParameter("rimage1")).delete();
			  // 새로운 이미지 등록
			  String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
				long size = file.getSize(); //파일 사이즈

				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
				String uploadFolder = "D:\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\teamProjectA\\resources\\images\\lodging_images";
							
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");			
				String uniqueName = uuids[0];
				
				File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
				try {
					file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				vo.setRimage1(uniqueName+fileExtension); 
		 }else {
			 	//새로운 이미지가 등록되지 않았다면 기존 이미지 그대로 사용
			    vo.setRimage1(req.getParameter("rimage1"));	 
		 }
			  
		 sellerService.roomModify(vo);
		 sellerService.roomModify2(in);
		
		 return "redirect:/seller/sellerRegi.do";
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
		
		//user lodging이 "Waiting"이면 페이지 접속 불가
		if(login.getLodging().equals("Waiting") || login.getLodging().equals("Y")) {
			//????????
		}
		
		return "seller/sellerLodgingUp";
	}
	
	@RequestMapping(value="/sellerLodgingUp.do", method=RequestMethod.POST)
	public String sellerLodgingUp(LodgingVO vo, HttpServletRequest req, MultipartFile file) {
		
		sellerService.lodgingUp(vo);
		sellerService.waiting(vo);
		
		//Waiting으로 변경된 user데이터 session에 담기
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		login.setLodging("Waiting");
		
		session.setAttribute("login", login);
		
		//이미지(파일) 업로드
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
		String uploadFolder = "C:\\Users\\798\\Documents\\workspace-sts-3.9.13.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\teamProjectA\\resources\\images\\\\lodging_images";
		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정상 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜덤 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:sellerInfo.do";
	}
	

}
