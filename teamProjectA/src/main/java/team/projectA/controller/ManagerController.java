package team.projectA.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import team.projectA.service.LodgingService;
import team.projectA.service.ManagerService;
import team.projectA.service.MypageService;
import team.projectA.service.ReservService;
import team.projectA.service.SellerService;
import team.projectA.service.UserService;
import team.projectA.vo.FestivalVO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.PageMaker;
import team.projectA.vo.PagingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.TripVO;
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
	private MypageService mypageService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private UserService userService;
	@RequestMapping(value = "/managerUser.do", method = RequestMethod.GET)
	public String user(Model model,UserVO vo,ReservVO vo1,HttpServletRequest req, @ModelAttribute("scri") SearchCriteria scri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(managerService.userlistCount());
		List<UserVO> muserList = null;
		HashMap<String, Object> hm1 = new HashMap<String, Object>();
		List<UserVO> list = userService.userList(vo);
		hm1.put("rowStart", scri.getRowStart());
		hm1.put("rowEnd", scri.getRowEnd());
		muserList = managerService.muserList(hm1);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("muserList",muserList);
	
		return "manager/managerUser";
	
	}
	//QnA리스트 
	/*@RequestMapping(value = "/managerQnaList.do", method = RequestMethod.GET)
	public String qna(UserVO vo, Model model,ReservVO vo1) {
		
		List<ReservVO> list1 = managerService.reservlist(vo1);
		List<UserVO> list = userService.userList(vo);
		List<QnaVO> list2 = managerService.managerqnalist();
		model.addAttribute("list",list);
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		return "manager/managerQnaList";
	}*/
	//QnA리스트 
		@RequestMapping(value = "/managerQnaList.do", method = RequestMethod.GET)
		public String qna(Model model,  @ModelAttribute("scri") SearchCriteria scri) {
			
			List<QnaVO> qnalist = managerService.qnaList(scri);
			model.addAttribute("qnalist", qnalist); 
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(managerService.qnacount());
			model.addAttribute("pageMaker", pageMaker);	 

			
			
			return "manager/managerQnaList";
		}

	//문의내역 상세화면
	@RequestMapping(value="/managerQna.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int qna_idx) {
			
			QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
			model.addAttribute("qnaOne",qnaOne);
			
		return "manager/managerQna";
	}
	//문의내역 답변등록전 상세화면
	@RequestMapping(value="/managerQnaView.do", method = RequestMethod.GET)
	public String managerQnaView(Locale locale, Model model, int qna_idx,String qna_Acontent) {
			
			QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
			model.addAttribute("qnaOne",qnaOne);

		return "manager/managerQnaView";
	}
	//답변등록
	@RequestMapping(value="/managerQna.do", method = RequestMethod.POST)
	public String managerReply(Model model,int qna_idx,String qna_Acontent) {
		System.out.println("qna_Acontent"+qna_Acontent);

		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("qna_idx",qna_idx);
		hm.put("qna_Acontent",qna_Acontent);
		managerService.qnaReply(hm);
		
			
		return "redirect:/manager/managerQnaList.do";
	}
	
	@RequestMapping(value = "/managerRoom.do", method = RequestMethod.GET)
	public String Room(Locale locale, Model model,LodgingVO rdv,@ModelAttribute("scri") SearchCriteria scri2) throws Exception{
		List<LodgingVO> lodlist = managerService.managerRoomList(scri2);
		model.addAttribute("lodlist",lodlist);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri2);
		pageMaker.setTotalCount(managerService.RoomListcount());
		model.addAttribute("pageMaker", pageMaker);	 

		return "manager/managerRoom";
	}
	//���ҽ���
	@RequestMapping(value="/requestApproval.do", method = RequestMethod.POST)
	public String requestApproval(int uidx) {
		
		managerService.approval(uidx);
		
		return "redirect:managerRoomOK.do";
	}
	//���ҽ��ΰź�
	@RequestMapping(value="/requestDel.do", method = RequestMethod.POST)
	public String requestDel(int uidx, int lidx) {
		
		managerService.requestDel(lidx);
		managerService.requestN(uidx);
		
		return "redirect:managerRoomOK.do";
	}
	
	@RequestMapping(value = "/managerReview.do", method = RequestMethod.GET)
	public String Review(Model model,ReviewVO rev,@ModelAttribute("scri") SearchCriteria scri3)throws Exception {  
		logger .info("get list search");
		List<ReviewVO> rlist = managerService.ReviewList(scri3);
		model.addAttribute("rlist", rlist);        
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri3);
		pageMaker.setTotalCount(managerService.reviewcount());
		model.addAttribute("pageMaker", pageMaker);	 

		
		
		return "manager/managerReview";
	}
	 //리뷰 상세보기
	  @RequestMapping(value="/managerRinfo.do", method = RequestMethod.GET)
	  public String reviewInfo(int rvidx, String limagename, Model model,HttpServletResponse response)throws Exception{
		  	
			ReviewVO vo = mypageService.reviewList2(rvidx);
			model.addAttribute("vo",vo);
			model.addAttribute("limagename",limagename);
		  return "manager/managerRinfo"; 
	  }
	//리뷰 삭제
		@RequestMapping (value = "/Reviewdelete.do" , method = RequestMethod.GET)
		public String reviewdelete(Locale locale, Model model, int rvidx){
			
			managerService.reviewDelete(rvidx);
			
			return "redirect:managerReview.do";
		}

	@RequestMapping(value = "/managerReservList.do", method = RequestMethod.GET)
	public String reservList(UserVO vo, Model model,ReservVO vo1,@ModelAttribute("scri") SearchCriteria scri4) {
		
		List<ReservVO> list1 = managerService.reservlist(scri4);
		model.addAttribute("list1",list1);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri4);
		pageMaker.setTotalCount(managerService.reservcount());
		model.addAttribute("pageMaker", pageMaker);	 
		
		return "manager/managerReservList";
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
	@RequestMapping(value="managerRoomOK.do", method = RequestMethod.GET)
	public String requestApproval(Model model) throws Exception{
		List<LodgingVO> requestList = managerService.requestList();
		model.addAttribute("requestList", requestList);
		
		//���� �α���õ
		List<LodgingVO> lodgingCategory = null;
		lodgingCategory = managerService.lodgingCategory();
		model.addAttribute("lodgingCategory",lodgingCategory);
		
		
		
		return "manager/managerRoomOK";
	}
	
	
	// --관리자 페스티발 --
	
	//관리자 페스티발 리스트 페이지
	@RequestMapping(value="managerFestival.do", method = RequestMethod.GET)
	public String managerFestival(Model model) throws Exception{
		
			List<FestivalVO> festivalList = managerService.festivalList();
			
			model.addAttribute("festivalList", festivalList);
		return "manager/managerFestival";
	}
	
	//관리자 페스티발 등록 페이지
	@RequestMapping(value="festivalPlus.do", method = RequestMethod.GET)
	public String festivalPlusPage(Model model) throws Exception{
		
			
		return "manager/managerFestivalPlus";
	}
	//관리자 페스티발 등록 
	@RequestMapping(value="festivalPlus.do", method = RequestMethod.POST)
	public String festivalPlus(HttpServletResponse response,String ftName,String ftAddr,String ftSubContent,String ftMainContent,String ftLink,String ftLatitude,String ftLongitude,String ftImgName) throws Exception{

		HashMap<String,String> hm = new HashMap<String,String>();
		hm.put("ftName", ftName);
		hm.put("ftAddr", ftAddr);
		hm.put("ftSubContent", ftSubContent);
		hm.put("ftMainContent", ftMainContent);
		hm.put("ftLink", ftLink);
		hm.put("ftLatitude", ftLatitude);
		hm.put("ftLongitude", ftLongitude);
		hm.put("ftImgName", ftImgName);
		
		managerService.festivalPlus(hm);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('축제 등록이 완료되었습니다.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
			return "";
	}
	//관리자 페스티발 삭제 
	@RequestMapping(value="festivalDt.do", method = RequestMethod.GET)
	public String festivalDt(int ftidx,HttpServletResponse response,HttpServletRequest req)throws Exception {
			
			managerService.festivalDt(ftidx);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			out.append("<script>alert('삭제가 완료되었습니다.'); location.href='"+req.getContextPath()+"/manager/managerFestival.do';</script>"); 
			out.flush(); 
			out.close();

		return "";
	}
	//관리자 페스티발 상세페이지 
	@RequestMapping(value="festivalInfo.do", method = RequestMethod.GET)
	public String festivalInfo(int ftidx, Model model) {
		
		FestivalVO vo = managerService.festivalInfo(ftidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalInfo";
	}
	//관리자 페스티발 수정페이지 
	@RequestMapping(value="festivalMf.do", method = RequestMethod.GET)
	public String festivalMf(int ftidx, Model model) {
		
		FestivalVO vo = managerService.festivalInfo(ftidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalMf";
	}
	//관리자 페스티발 수정 
	@RequestMapping(value="festivalMf.do", method = RequestMethod.POST)
	public String festivalMf(FestivalVO festivalVO,HttpServletResponse response)throws Exception{
		
		managerService.festivalUt(festivalVO);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('수정이 완료되었습니다.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}

	// --관리자 인기여행지 --
	
	//관리자 인기여행지 리스트 페이지
	@RequestMapping(value="managerTrip.do", method = RequestMethod.GET)
	public String managerTrip(Model model) throws Exception{
		
		List<TripVO> tripList = managerService.tripList();
		
		model.addAttribute("tripList",tripList);
		return "manager/managerTrip";
	}
	//관리자 인기여행지 등록 페이지
	@RequestMapping(value="tripPlus.do", method = RequestMethod.GET)
	public String tripPlusPage(Model model) throws Exception{
		
			
		return "manager/managerTripPlus";
	}
	//관리자 인기여행지 등록 
	@RequestMapping(value="tripPlus.do", method = RequestMethod.POST)
	public String tripPlus(HttpServletResponse response,String tName,String tAddr,String tSubContent,String tMainContent,String tLink,String tLatitude,String tLongitude,String tImgName) throws Exception{

		HashMap<String,String> hm = new HashMap<String,String>();
		hm.put("tName", tName);
		hm.put("tAddr", tAddr);
		hm.put("tSubContent", tSubContent);
		hm.put("tMainContent", tMainContent);
		hm.put("tLink", tLink);
		hm.put("tLatitude", tLatitude);
		hm.put("tLongitude", tLongitude);
		hm.put("tImgName", tImgName);
		
		managerService.tripPlus(hm);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('여행지 등록이 완료되었습니다.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
			return "";
	}
	//관리자 인기여행지 삭제 
	@RequestMapping(value="tripDt.do", method = RequestMethod.GET)
	public String tripDt(int tidx,HttpServletResponse response,HttpServletRequest req)throws Exception {
			
			managerService.tripDt(tidx);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			out.append("<script>alert('삭제가 완료되었습니다.'); location.href='"+req.getContextPath()+"/manager/managerTrip.do';</script>"); 
			out.flush(); 
			out.close();

		return "";
	}
	//관리자 인기여행지 상세페이지 
	@RequestMapping(value="tripInfo.do", method = RequestMethod.GET)
	public String tripInfo(int tidx, Model model) {
		
		TripVO vo = managerService.tripInfo(tidx);
		model.addAttribute("vo",vo);
		
		return "manager/managerTripInfo";
	}
	//관리자 인기여행지 수정페이지 
	@RequestMapping(value="tripMf.do", method = RequestMethod.GET)
	public String tiprMf(int tidx, Model model) {
		
		TripVO vo = managerService.tripInfo(tidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerTripMf";
	}
	//관리자 페스티발 수정 
	@RequestMapping(value="tripMf.do", method = RequestMethod.POST)
	public String tripMf(TripVO tripVO,HttpServletResponse response)throws Exception{
		
		managerService.tripUt(tripVO);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('수정이 완료되었습니다.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}
	//위도,경도 추출을 위한 지도 팝업창
	@RequestMapping(value="mapOn.do", method = RequestMethod.GET)
	public String mapOn(){
		
		return "manager/managerMapOn";
	}
}
