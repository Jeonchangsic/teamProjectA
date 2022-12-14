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
import team.projectA.service.IndexService;
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
	private IndexService indexService;
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
	//QnA????????? 
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
	//QnA????????? 
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

	//???????????? ????????????
	@RequestMapping(value="/managerQna.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int qna_idx) {
			
			QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
			model.addAttribute("qnaOne",qnaOne);
			
		return "manager/managerQna";
	}
	//???????????? ??????????????? ????????????
	@RequestMapping(value="/managerQnaView.do", method = RequestMethod.GET)
	public String managerQnaView(Locale locale, Model model, int qna_idx,String qna_Acontent) {
			
			QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
			model.addAttribute("qnaOne",qnaOne);

		return "manager/managerQnaView";
	}
	//????????????
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
	//????????????????????
	@RequestMapping(value="/requestApproval.do", method = RequestMethod.POST)
	public String requestApproval(int uidx,HttpServletResponse response, HttpServletRequest req)throws Exception {
		
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('?????? ????????? ?????????????????????.');  location.href='"+req.getContextPath()+"/manager/managerRoomOK.do';</script>"); 
		out.flush(); 
		out.close();
		
		managerService.approval(uidx);
		
		
		return "";
	}
	//????????????????????????
	@RequestMapping(value="/requestDel.do", method = RequestMethod.POST)
	public String requestDel(int uidx, int lidx,HttpServletResponse response,HttpServletRequest req)throws Exception{
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('?????? ????????? ?????????????????????.'); location.href='"+req.getContextPath()+"/manager/managerRoomOK.do';</script>"); 
														
		out.flush(); 
		out.close();
		
		managerService.requestDel(lidx);
		managerService.requestN(uidx);
		
		return "";
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
	 //?????? ????????????
	  @RequestMapping(value="/managerRinfo.do", method = RequestMethod.GET)
	  public String reviewInfo(int rvidx, String limagename, Model model,HttpServletResponse response)throws Exception{
		  	
			ReviewVO vo = mypageService.reviewList2(rvidx);
			model.addAttribute("vo",vo);
			model.addAttribute("limagename",limagename);
		  return "manager/managerRinfo"; 
	  }
	//?????? ??????
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
		
		//???????????? ????????????????
		List<LodgingVO> lodgingCategory = null;
		lodgingCategory = managerService.lodgingCategory();
		model.addAttribute("lodgingCategory",lodgingCategory);
		
		
		
		return "manager/managerRoomOK";
	}
	
	
					// --????????? ???????????? --
	
	//????????? ???????????? ????????? ?????????
	@RequestMapping(value="managerFestival.do", method = RequestMethod.GET)
	public String managerFestival(@ModelAttribute("scri")SearchCriteria scri,Model model) throws Exception{
		
			List<FestivalVO> festivalList = managerService.festivalList(scri);
			model.addAttribute("festivalList", festivalList);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(managerService.festivalCnt());
			model.addAttribute("pageMaker",pageMaker);
		return "manager/managerFestival";
	}
	
	//????????? ???????????? ?????? ?????????
	@RequestMapping(value="festivalPlus.do", method = RequestMethod.GET)
	public String festivalPlusPage(Model model) throws Exception{
		
			
		return "manager/managerFestivalPlus";
	}
	//????????? ???????????? ?????? 
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
		
		out.append("<script>alert('?????? ????????? ?????????????????????.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
			return "";
	}
	//????????? ???????????? ?????? 
	@RequestMapping(value="festivalDt.do", method = RequestMethod.GET)
	public String festivalDt(int ftidx,HttpServletResponse response,HttpServletRequest req)throws Exception {
			
			managerService.festivalDt(ftidx);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			out.append("<script>alert('????????? ?????????????????????.'); location.href='"+req.getContextPath()+"/manager/managerFestival.do';</script>"); 
			out.flush(); 
			out.close();

		return "";
	}
	//????????? ???????????? ??????????????? 
	@RequestMapping(value="festivalInfo.do", method = RequestMethod.GET)
	public String festivalInfo(int ftidx, Model model) {
		
		FestivalVO vo = managerService.festivalInfo(ftidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalInfo";
	}
	//????????? ???????????? ??????????????? 
	@RequestMapping(value="festivalMf.do", method = RequestMethod.GET)
	public String festivalMf(int ftidx, Model model) {
		
		FestivalVO vo = managerService.festivalInfo(ftidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalMf";
	}
	//????????? ???????????? ?????? 
	@RequestMapping(value="festivalMf.do", method = RequestMethod.POST)
	public String festivalMf(FestivalVO festivalVO,HttpServletResponse response)throws Exception{
		
		managerService.festivalUt(festivalVO);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('????????? ?????????????????????.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}
	//????????? ???????????? ?????? ???????????????
	@RequestMapping(value="festivalRegPage.do", method = RequestMethod.GET)
	public String festivalRegPage(Model model){
		
		List<FestivalVO> notVO = managerService.festivalNotRegList();
		List<FestivalVO> vo = managerService.festivalRegList();
		
		model.addAttribute("notVO",notVO);
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalMainReg";
	}
	//????????? ???????????? ????????? ???????????? ?????????
	@RequestMapping(value="festivalListPreview.do", method = RequestMethod.GET)
	public String festivalListPreview(Model model){
		
		List<FestivalVO> festivalList = indexService.mainFestivalList();
		model.addAttribute("festivalList",festivalList);
		
		return "manager/managerFestivalListPreview";
	}
					// --????????? ??????????????? --
	
	//????????? ??????????????? ????????? ?????????
	@RequestMapping(value="managerTrip.do", method = RequestMethod.GET)
	public String managerTrip(@ModelAttribute("TripScri")SearchCriteria TripScri,Model model) throws Exception{
		
		List<TripVO> tripList = managerService.tripList(TripScri);
		model.addAttribute("tripList",tripList);
		
		PageMaker pageMaker2 = new PageMaker();
		pageMaker2.setCri(TripScri);
		pageMaker2.setTotalCount(managerService.festivalCnt());
		model.addAttribute("pageMaker",pageMaker2);
		
		return "manager/managerTrip";
	}
	//????????? ??????????????? ?????? ?????????
	@RequestMapping(value="tripPlus.do", method = RequestMethod.GET)
	public String tripPlusPage(Model model) throws Exception{
		
			
		return "manager/managerTripPlus";
	}
	//????????? ??????????????? ?????? 
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
		
		out.append("<script>alert('????????? ????????? ?????????????????????.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
			return "";
	}
	//????????? ??????????????? ?????? 
	@RequestMapping(value="tripDt.do", method = RequestMethod.GET)
	public String tripDt(int tidx,HttpServletResponse response,HttpServletRequest req)throws Exception {
			
			managerService.tripDt(tidx);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			out.append("<script>alert('????????? ?????????????????????.'); location.href='"+req.getContextPath()+"/manager/managerTrip.do';</script>"); 
			out.flush(); 
			out.close();

		return "";
	}
	//????????? ??????????????? ??????????????? 
	@RequestMapping(value="tripInfo.do", method = RequestMethod.GET)
	public String tripInfo(int tidx, Model model) {
		
		TripVO vo = managerService.tripInfo(tidx);
		model.addAttribute("vo",vo);
		
		return "manager/managerTripInfo";
	}
	//????????? ??????????????? ??????????????? 
	@RequestMapping(value="tripMf.do", method = RequestMethod.GET)
	public String tiprMf(int tidx, Model model) {
		
		TripVO vo = managerService.tripInfo(tidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerTripMf";
	}
	//????????? ??????????????? ?????? 
	@RequestMapping(value="tripMf.do", method = RequestMethod.POST)
	public String tripMf(TripVO tripVO,HttpServletResponse response)throws Exception{
		
		managerService.tripUt(tripVO);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('????????? ?????????????????????.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}
	//????????? ??????????????? ?????????????????????
	@RequestMapping(value="tripRegPage.do", method = RequestMethod.GET)
	public String tripRegPage(Model model){
		
		List<TripVO> notVO = managerService.tripNotRegList();
		List<TripVO> vo = managerService.tripRegList();
		
		model.addAttribute("notVO",notVO);
		model.addAttribute("vo",vo);
		
		return "manager/managerTripMainReg";
	}
	//????????? ??????????????? ????????? ???????????? ?????????
	@RequestMapping(value="tripListPreview.do", method = RequestMethod.GET)
	public String tripListPreview(Model model){
		
		List<TripVO> tripList = indexService.mainTripList();
		model.addAttribute("tripList",tripList);
		
		return "manager/managerTripListPreview";
	}
	
	
	//??????,?????? ????????? ?????? ?????? ?????????
	@RequestMapping(value="mapOn.do", method = RequestMethod.GET)
	public String mapOn(){
		
		return "manager/managerMapOn";
	}
}
