package team.projectA.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import team.projectA.service.ReservService;
import team.projectA.service.SellerService;
import team.projectA.vo.Criteria;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.LodginginfoVO;
import team.projectA.vo.PageMaker;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;
 
/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/seller")
@Controller
public class SellerController {
	 	
	@Autowired
	private SellerService sellerService;
	@Autowired
	private ReservService reservService;
	@Autowired
	private JavaMailSender mailSender;
	
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

	//이메일 변경 이메일 인증
	@ResponseBody
	@RequestMapping(value="/mailCheck2", method = RequestMethod.GET)
	public String mailCheck(String email) throws Exception {

		//화면에서 넘어온 데이터 확인
				System.out.println("이메일"+email);
				
				//인증번호(난수) 생성
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111; //111111 ~ 999999 의 수로 난수 생성하기 위함
				System.out.println("인증번호"+checkNum); //인증번호가 난수로 잘 생성되고 있는지 확인
				
				//이메일 보내기
				String setFrom = "teamPjtA1@gmail.com"; //root-context.xml에 삽입한 자신의 이메일 계정 (메일 발신할 계정)
				String toMail = email; //입력받은 메일값
				String title = "저긴어때(주) 이메일 변경 인증 이메일 입니다."; //발신 시 사용되는 이메일 제목
				String content = 								//발신 시 사용되는 이메일의 내용
						"저긴어때(주) 이메일 변경 인증 이메일 입니다." +
				        "<br><br>" + 
		                "인증 번호는 " + checkNum + "입니다." + 
		                "<br>" + 
		                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
				
				
				
				  try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
				  helper = new MimeMessageHelper(message,true,"utf-8");
				  helper.setFrom(setFrom); //메일 발신할 계정 
				  helper.setTo(toMail); //수신자 계정
				  helper.setSubject(title); //발신 시 사용되는 이메일 제목 
				  helper.setText(content,true); //발신 시 사용되는 이메일 내용 
				  mailSender.send(message); 
				  }catch(Exception e){
				  e.printStackTrace(); 
				  }
				 
				String num = Integer.toString(checkNum); //난수를 ajax를 통해 뷰로 다시 반환해야하는데 난수 생성 시 사용한 자료형은 int형이지만 ajax로 반환시에는 String형식만 가능하여 팟싱함
				
				return num;   //ResponseBody 어노테이션이 설정된 메소드는 반환값이 ajax의 success의 함수 매개변수로 들어간다. 그 값은 num.
	}
	
		
		
	//문의글 리스트+페이징+검색
    @RequestMapping(value = "/sellerInquire.do", method = RequestMethod.GET)
    public String sellerInquire(Model model, HttpServletRequest req, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
 
                                                                        
		HttpSession session = req.getSession();                                 
		UserVO login = (UserVO) session.getAttribute("login");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);

		
		HashMap<String, Object> hm2 = new HashMap<String,Object>();
		hm2.put("uidx", login.getUidx());
		hm2.put("keyword",scri.getKeyword());
		
		pageMaker.setTotalCount(sellerService.listCount(hm2));

		
		List<QnaVO> qnaList = null;
		       
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("uidx", login.getUidx());
		hm.put("rowStart", scri.getRowStart());
		hm.put("rowEnd", scri.getRowEnd());
		hm.put("keyword", scri.getKeyword());
		qnaList = sellerService.qnaList(hm);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageMaker", pageMaker);
		
               
        return "seller/sellerInquire";
        

    }
    
    //문의글
	@RequestMapping(value="/sellerInquireView.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int qna_idx) {
				
		QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
		model.addAttribute("qnaOne",qnaOne);
			
		
		
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
	//문의글 삭제
	@RequestMapping (value = "/sellerdelete.do" , method = RequestMethod.GET)
	public String sellerdelete(Locale locale, Model model, int qna_idx) {
	      
		sellerService.qnaDelete(qna_idx);
	   

		return "redirect:sellerInquire.do";
	}

	@RequestMapping (value = "/sellerInquireModify.do", method = RequestMethod.GET)
	public String sellerInquireModify(Locale locale, Model model, int qna_idx) {
		
		QnaVO qnaone = (QnaVO)sellerService.qnaOne(qna_idx);
		model.addAttribute("qnaOne", qnaone);
		
		return "seller/sellerInquireModify";
	}
	
	//문의글 수정
		@RequestMapping (value = "/sellerInquireModify.do", method = RequestMethod.POST)
		public String sellerInquireModify(QnaVO vo) {
			
			sellerService.qnaModify(vo);

			return  "redirect:sellerInquireView.do?qna_idx="+vo.getQna_idx();

		}
	
	
	//객실 리스트
	   @RequestMapping(value = "/sellerRegi.do", method = RequestMethod.GET)
	   public String Regi(Locale locale, Model model, HttpServletRequest req) {
	      
	   
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");   
		List<RoomVO> roomlist = sellerService.roomlist(login.getUidx());
		List<RoomVO> ridxone = sellerService.ridxOnelist(login.getUidx());      
		LodgingVO lodging2 = sellerService.SellerOne(login.getUidx());
		
		model.addAttribute("roomlist",roomlist);
		model.addAttribute("lodging2",lodging2);
		model.addAttribute("ridxone", ridxone);
		
		
		return "seller/sellerRegi";
	   }
	   
	
	//객실 삭제 (redirect해야해서 가상경로 따로 설정함)
	@RequestMapping(value = "/sellerRegi2.do", method = RequestMethod.POST)
	public void Regi2(Locale locale, Model model, int ridx, HttpServletResponse res) throws IOException {
		
		List<ReservVO> delridx = reservService.ridxList(ridx);
		
		PrintWriter out = res.getWriter();
		
		if(delridx == null || delridx.isEmpty()) {
			sellerService.roomdel(ridx);
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = res.getWriter();
			pw.append("<script>alert('삭제되었습니다.');location='sellerRegi.do'</script>");
			out.flush();
			out.close();
			
		}else {			
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = res.getWriter();
			pw.append("<script>alert('예약이 있는 객실은 삭제할 수 없습니다.'); history.go(-1);</script>");
			out.flush();
			out.close();
		}
				
		//return "redirect:sellerRegi.do";
		
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
	public String roomup1(RoomVO vo, MultipartFile[] files, RoominVO room, HttpServletRequest req) throws Exception {
		
		for(int i=0; i<files.length; i++) {
			String fileRealName = files[i].getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
			long size = files[i].getSize(); //파일 사이즈
			
			System.out.println("파일명 : "  + fileRealName);
			System.out.println("용량크기(byte) : " + size);
			//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/lodging_images");
			
			
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
				files[i].transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(i==0) {
				vo.setRimage1(uniqueName+fileExtension); //파일이름 + 확장자 vo 에 넣어줌 (db입력)				
			}else if(i==1) {
				vo.setRimage2(uniqueName+fileExtension);				
			}else if(i==2) {
				vo.setRimage3(uniqueName+fileExtension);				
			}else if(i==3) {
				vo.setRimage4(uniqueName+fileExtension);				
			}else if(i==4) {
				vo.setRimage5(uniqueName+fileExtension);			
			}
		}
		int maxridx = sellerService.roomup(vo);		
		room.setRidx(maxridx);
		
		sellerService.roomInCh(room);
				
		return "redirect: sellerRoomup3.do";
	}
		
	//객실수정 정보
	@RequestMapping(value = "/sellerRoomup2.do", method = RequestMethod.GET)
	public String roomup2(Locale locale, Model model, int ridx) {
		
		RoominVO roomModify = sellerService.roomModiInfo(ridx);
		System.out.println("mo:"+roomModify);
		model.addAttribute("mo", roomModify);
		
		return "seller/sellerRoomup2";
	}
	
	//객실 수정
	@RequestMapping (value = "/sellerRoomup2.do", method = RequestMethod.POST)
	public String roomModify(Locale locale, Model model, MultipartFile[] files, HttpServletRequest req, RoomVO vo, RoominVO in)throws Exception {

		for(int i = 0; i<files.length; i++) {
			//새로운 이미지가 등록 되어있는지 확인
				if(files[i].getOriginalFilename() != null && files[i].getOriginalFilename() != "") {
					
					String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/lodging_images");
					
					// 기존 이미지 삭제 //uploadPath없으면 삭제가안됨
					new File(uploadFolder + req.getParameter("rimage" + (i+1))).delete();
					System.out.println("삭제성공");
					// 이미지 등록
					String fileRealName = files[i].getOriginalFilename();
					long size = files[i].getSize();
					
					System.out.println("파일이름"+fileRealName);
					System.out.println("크기"+size);
	
	
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
	
					UUID uuid = UUID.randomUUID();
	
					String[] uuids = uuid.toString().split("-");
	
					String uniqueName = uuids[0];
	
					File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
					try {
						files[i].transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					if(i==0) {
						vo.setRimage1(uniqueName+fileExtension); //파일이름 + 확장자 vo 에 넣어줌 (db입력)				
					}else if(i==1) {
						vo.setRimage2(uniqueName+fileExtension);				
					}else if(i==2) {
						vo.setRimage3(uniqueName+fileExtension);				
					}else if(i==3) {
						vo.setRimage4(uniqueName+fileExtension);				
					}else if(i==4) {
						vo.setRimage5(uniqueName+fileExtension);	
					}
			} else {
				// 새로운 이미지가 등록되지 않아다면 기본 이미지 그대로
				if (i == 0) {
					vo.setRimage1(req.getParameter("rimage1")); // 파일이름 + 확장자 vo 에 넣어줌 (db입력)
				} else if (i == 1) {
					vo.setRimage2(req.getParameter("rimage2"));
				} else if (i == 2) {
					vo.setRimage3(req.getParameter("rimage3"));
				} else if (i == 3) {
					vo.setRimage4(req.getParameter("rimage4"));
				} else if (i == 4) {
					vo.setRimage5(req.getParameter("rimage5"));
				}
			}
		}
		sellerService.roomModify(vo);
		sellerService.roomModify2(in);
		 
		return "redirect:/seller/sellerRegi.do";
	}
	
	@RequestMapping(value = "/sellerRoomup3.do", method = RequestMethod.GET)
	public String roomup3(Locale locale, Model model) {
		
	
		
		return "seller/sellerRoomup3";
	}
	//
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	//숙소등록페이지
	@RequestMapping(value="/sellerLodgingUp.do", method=RequestMethod.GET)
	public String sellerLodgingUp(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		model.addAttribute("vo", login);		
		/*
		//user lodging이 "Waiting", "Y"이면 페이지 접속 불가
		if(login.getLodging().equals("Waiting") || login.getLodging().equals("Y")) {
			//????????
		}
		*/
		return "seller/sellerLodgingUp";
	}
	//숙소등록
	@RequestMapping(value="/sellerLodgingUp.do", method=RequestMethod.POST)
	public String sellerLodgingUp(LodgingVO vo, int uidx, LodginginVO invo, LodginginfoVO infovo, HttpServletRequest req, MultipartFile file) {
		
		//이미지(파일) 업로드
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
		String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/lodging_images");
		
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
		
		vo.setLimagename(uniqueName+fileExtension); // (파라미터로 받아온 file을) 위에서 처리해서 나온 파일명을 (db에 넣어줄) vo변수(칼럼)에 담아준다
		
		//insert, update
	
		int maxlidx = sellerService.lodgingUp(vo);
		invo.setLidx(maxlidx);
		infovo.setLidx(maxlidx);
		sellerService.lodginginUp(invo);
		sellerService.lodginginfoUp(infovo);
		sellerService.waiting(uidx);		
		//Waiting으로 변경된 user데이터 session에 담기
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		login.setLodging("Waiting");
		
		session.setAttribute("login", login);
		
		return "redirect:sellerInfo.do";
	}
	//숙소 수정 페이지
	@RequestMapping(value = "/sellerLodgingModify.do", method = RequestMethod.GET)
	public String sellerLodgingModify(Model model, int lidx) {
		
		Map<String, Object> hm = sellerService.lodgingModi(lidx);
				
		System.out.println(hm);				
		model.addAttribute("hm", hm);	
	
		return "seller/sellerLodgingModify";
	}
	//숙소 수정
	@RequestMapping(value = "/sellerLodgingModify.do", method = RequestMethod.POST)
	public String sellerLodgingModify(LodgingVO vo, LodginginVO invo, LodginginfoVO infovo, HttpServletRequest req, MultipartFile file) {
			
		//새로운 이미지가 등록 되어있나 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 이미지 삭제
			new File(req.getParameter("limagename")).delete();
			
			// 새로운 이미지 등록
			String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
			long size = file.getSize(); //파일 사이즈
				
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/lodging_images");
						
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
				vo.setLimagename(uniqueName+fileExtension); 
		}else {
			//새로운 이미지가 등록되지 않았다면 기존 이미지 그대로 사용
			vo.setLimagename(req.getParameter("limagename"));	 
		}
		
		sellerService.lodgingModify(vo);
		sellerService.lodginginModify(invo);
		sellerService.lodginginfoModify(infovo);
		
		return "redirect:sellerRegi.do";
	}
	//숙소 삭제
	@RequestMapping(value = "/sellerRegi.do", method = RequestMethod.POST)
	public void sellerLoDel(Model model, int lidx, int uidx, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		sellerService.loDel(lidx);
		sellerService.N(uidx);
		 
		//Waiting으로 변경된 user데이터 session에 담기
		HttpSession session = req.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		login.setLodging("N");
		session.setAttribute("login", login);
		
		//숙소 삭제 후 alert
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = res.getWriter();
		pw.append("<script>alert('삭제되었습니다.');location='sellerInfo.do'</script>");
		
		//return "redirect:sellerInfo.do";		
	}
	//
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	
	
}
