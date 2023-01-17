package team.projectA.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

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
	//QnA由ъ뒪�듃 
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
	//QnA由ъ뒪�듃 
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

	//臾몄쓽�궡�뿭 �긽�꽭�솕硫�
	@RequestMapping(value="/managerQna.do", method = RequestMethod.GET)
	public String sellerInquireView(Locale locale, Model model, int qna_idx) {
			
			QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
			model.addAttribute("qnaOne",qnaOne);
			
		return "manager/managerQna";
	}
	//臾몄쓽�궡�뿭 �떟蹂��벑濡앹쟾 �긽�꽭�솕硫�
	@RequestMapping(value="/managerQnaView.do", method = RequestMethod.GET)
	public String managerQnaView(Locale locale, Model model, int qna_idx,String qna_Acontent) {
			
			QnaVO qnaOne = (QnaVO)sellerService.qnaOne(qna_idx);
			model.addAttribute("qnaOne",qnaOne);

		return "manager/managerQnaView";
	}
	//�떟蹂��벑濡�
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
	//占쏙옙占쌀쏙옙占쏙옙
	@RequestMapping(value="/requestApproval.do", method = RequestMethod.POST)
	public String requestApproval(int uidx,HttpServletResponse response, HttpServletRequest req)throws Exception {
		
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('�닕�냼 �듅�씤�씠 �셿猷뚮릺�뿀�뒿�땲�떎.');  location.href='"+req.getContextPath()+"/manager/managerRoomOK.do';</script>"); 
		out.flush(); 
		out.close();
		
		managerService.approval(uidx);
		
		
		return "";
	}
	//占쏙옙占쌀쏙옙占싸거븝옙
	@RequestMapping(value="/requestDel.do", method = RequestMethod.POST)
	public String requestDel(int uidx, int lidx,HttpServletResponse response,HttpServletRequest req)throws Exception{
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('�닕�냼 �듅�씤�씠 嫄곕��릺�뿀�뒿�땲�떎.'); location.href='"+req.getContextPath()+"/manager/managerRoomOK.do';</script>"); 
														
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
	 //由щ럭 �긽�꽭蹂닿린
	  @RequestMapping(value="/managerRinfo.do", method = RequestMethod.GET)
	  public String reviewInfo(int rvidx, String limagename, Model model,HttpServletResponse response)throws Exception{
		  	
			ReviewVO vo = mypageService.reviewList2(rvidx);
			model.addAttribute("vo",vo);
		  return "manager/managerRinfo"; 
	  }
	//由щ럭 �궘�젣
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
		
		//占쏙옙占쏙옙 占싸깍옙占쏙옙천
		List<LodgingVO> lodgingCategory = null;
		lodgingCategory = managerService.lodgingCategory();
		model.addAttribute("lodgingCategory",lodgingCategory);
		
		
		
		return "manager/managerRoomOK";
	}
	
	
					// --愿�由ъ옄 �럹�뒪�떚諛� --
	
	//愿�由ъ옄 �럹�뒪�떚諛� 由ъ뒪�듃 �럹�씠吏�
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
	
	//愿�由ъ옄 �럹�뒪�떚諛� �벑濡� �럹�씠吏�
	@RequestMapping(value="festivalPlus.do", method = RequestMethod.GET)
	public String festivalPlusPage(Model model) throws Exception{
		
			
		return "manager/managerFestivalPlus";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� �벑濡� 
	@RequestMapping(value="festivalPlus.do", method = RequestMethod.POST)
	public String festivalPlus(HttpServletRequest req,HttpServletResponse response,String ftName,String ftAddr,String ftSubContent,String ftMainContent,String ftLink,String ftLatitude,String ftLongitude, MultipartFile ftImgName) throws Exception{
		
		
				String fileRealName = ftImgName.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶
				long size = ftImgName.getSize(); //�뙆�씪 �궗�씠利�
				
				System.out.println("�뙆�씪紐� : "  + fileRealName);
				System.out.println("�슜�웾�겕湲�(byte) : " + size);
				//�꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽  �솗�옣�옄紐낆쓣 援ы븿
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
				String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/manager_images");
				
				/*
				  �뙆�씪 �뾽濡쒕뱶�떆 �뙆�씪紐낆씠 �룞�씪�븳 �뙆�씪�씠 �씠誘� 議댁옱�븷 �닔�룄 �엳怨� �궗�슜�옄媛� 
				  �뾽濡쒕뱶 �븯�뒗 �뙆�씪紐낆씠 �뼵�뼱 �씠�쇅�쓽 �뼵�뼱濡� �릺�뼱�엳�쓣 �닔 �엳�뒿�땲�떎. 
				  ���씤�뼱瑜� 吏��썝�븯吏� �븡�뒗 �솚寃쎌뿉�꽌�뒗 �젙�긽 �룞�옉�씠 �릺吏� �븡�뒿�땲�떎.(由щ늼�뒪媛� ���몴�쟻�씤 �삁�떆)
				  怨좎쑀�븳 �옖�뜡 臾몄옄瑜� �넻�빐 db�� �꽌踰꾩뿉 ���옣�븷 �뙆�씪紐낆쓣 �깉濡�寃� 留뚮뱾�뼱 以��떎.
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
					ftImgName.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("ftName", ftName);
		hm.put("ftAddr", ftAddr);
		hm.put("ftSubContent", ftSubContent);
		hm.put("ftMainContent", ftMainContent);
		hm.put("ftLink", ftLink);
		hm.put("ftLatitude", ftLatitude);
		hm.put("ftLongitude", ftLongitude);
		hm.put("ftImgName", uniqueName+fileExtension); // (�뙆�씪誘명꽣濡� 諛쏆븘�삩 file�쓣) �쐞�뿉�꽌 泥섎━�빐�꽌 �굹�삩 �뙆�씪紐낆쓣 (db�뿉 �꽔�뼱以�) vo蹂��닔(移쇰읆)�뿉 �떞�븘以��떎
		
		managerService.festivalPlus(hm);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('異뺤젣 �벑濡앹씠 �셿猷뚮릺�뿀�뒿�땲�떎.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
			return "";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� �궘�젣 
	@RequestMapping(value="festivalDt.do", method = RequestMethod.GET)
	public String festivalDt(int ftidx,HttpServletResponse response,HttpServletRequest req)throws Exception {
			
			managerService.festivalDt(ftidx);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			out.append("<script>alert('�궘�젣媛� �셿猷뚮릺�뿀�뒿�땲�떎.'); location.href='"+req.getContextPath()+"/manager/managerFestival.do';</script>"); 
			out.flush(); 
			out.close();

		return "";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� �긽�꽭�럹�씠吏� 
	@RequestMapping(value="festivalInfo.do", method = RequestMethod.GET)
	public String festivalInfo(int ftidx, Model model) {
		
		FestivalVO vo = managerService.festivalInfo(ftidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalInfo";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� �닔�젙�럹�씠吏� 
	@RequestMapping(value="festivalMf.do", method = RequestMethod.GET)
	public String festivalMf(int ftidx, Model model) {
		
		FestivalVO vo = managerService.festivalInfo(ftidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalMf";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� �닔�젙 
	@RequestMapping(value="festivalMf.do", method = RequestMethod.POST)
	public String festivalMf(int ftidx,String ftName,String ftAddr,String ftSubContent,String ftMainContent,String ftLink,String ftLatitude,String ftLongitude,HttpServletResponse response,HttpServletRequest req, MultipartFile ftImgName)throws Exception{

		// �깉濡쒖슫 �씠誘몄� �벑濡�
		String fileRealName = ftImgName.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
		long size = ftImgName.getSize(); //�뙆�씪 �궗�씠利�
			
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/manager_images");
					
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");			
		String uniqueName = uuids[0];
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // �쟻�슜 �썑
		try {
			ftImgName.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("ftidx", ftidx);
		hm.put("ftName", ftName);
		hm.put("ftAddr", ftAddr);
		hm.put("ftSubContent", ftSubContent);
		hm.put("ftMainContent", ftMainContent);
		hm.put("ftLink", ftLink);
		hm.put("ftLatitude", ftLatitude);
		hm.put("ftLongitude", ftLongitude);
		hm.put("ftImgName", uniqueName+fileExtension); // (�뙆�씪誘명꽣濡� 諛쏆븘�삩 file�쓣) �쐞�뿉�꽌 泥섎━�빐�꽌 �굹�삩 �뙆�씪紐낆쓣 (db�뿉 �꽔�뼱以�) vo蹂��닔(移쇰읆)�뿉 �떞�븘以��떎

		managerService.festivalUt(hm);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('�닔�젙�씠 �셿猷뚮릺�뿀�뒿�땲�떎.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� 硫붿씤 �벑濡앺럹�씠吏�
	@RequestMapping(value="festivalRegPage.do", method = RequestMethod.GET)
	public String festivalRegPage(Model model){
		
		List<FestivalVO> notVO = managerService.festivalNotRegList();
		List<FestivalVO> vo = managerService.festivalRegList();
		
		model.addAttribute("notVO",notVO);
		model.addAttribute("vo",vo);
		
		return "manager/managerFestivalMainReg";
	}
	//愿�由ъ옄 �럹�뒪�떚諛� 由ъ뒪�듃 誘몃━蹂닿린 �럹�씠吏�
	@RequestMapping(value="festivalListPreview.do", method = RequestMethod.GET)
	public String festivalListPreview(Model model){
		
		List<FestivalVO> festivalList = indexService.mainFestivalList();
		model.addAttribute("festivalList",festivalList);
		
		return "manager/managerFestivalListPreview";
	}
					// --愿�由ъ옄 �씤湲곗뿬�뻾吏� --
	
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� 由ъ뒪�듃 �럹�씠吏�
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
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� �벑濡� �럹�씠吏�
	@RequestMapping(value="tripPlus.do", method = RequestMethod.GET)
	public String tripPlusPage(Model model) throws Exception{
		
			
		return "manager/managerTripPlus";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� �벑濡� 
	@RequestMapping(value="tripPlus.do", method = RequestMethod.POST)
	public String tripPlus(HttpServletRequest req, HttpServletResponse response,String tName,String tAddr,String tSubContent,String tMainContent,String tLink,String tLatitude,String tLongitude,MultipartFile tImgName) throws Exception{

		String fileRealName = tImgName.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶
		long size = tImgName.getSize(); //�뙆�씪 �궗�씠利�
		
		System.out.println("�뙆�씪紐� : "  + fileRealName);
		System.out.println("�슜�웾�겕湲�(byte) : " + size);
		//�꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽  �솗�옣�옄紐낆쓣 援ы븿
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
		String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/manager_images");
		
		/*
		  �뙆�씪 �뾽濡쒕뱶�떆 �뙆�씪紐낆씠 �룞�씪�븳 �뙆�씪�씠 �씠誘� 議댁옱�븷 �닔�룄 �엳怨� �궗�슜�옄媛� 
		  �뾽濡쒕뱶 �븯�뒗 �뙆�씪紐낆씠 �뼵�뼱 �씠�쇅�쓽 �뼵�뼱濡� �릺�뼱�엳�쓣 �닔 �엳�뒿�땲�떎. 
		  ���씤�뼱瑜� 吏��썝�븯吏� �븡�뒗 �솚寃쎌뿉�꽌�뒗 �젙�긽 �룞�옉�씠 �릺吏� �븡�뒿�땲�떎.(由щ늼�뒪媛� ���몴�쟻�씤 �삁�떆)
		  怨좎쑀�븳 �옖�뜡 臾몄옄瑜� �넻�빐 db�� �꽌踰꾩뿉 ���옣�븷 �뙆�씪紐낆쓣 �깉濡�寃� 留뚮뱾�뼱 以��떎.
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
			tImgName.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		HashMap<String,String> hm = new HashMap<String,String>();
		hm.put("tName", tName);
		hm.put("tAddr", tAddr);
		hm.put("tSubContent", tSubContent);
		hm.put("tMainContent", tMainContent);
		hm.put("tLink", tLink);
		hm.put("tLatitude", tLatitude);
		hm.put("tLongitude", tLongitude);
		hm.put("tImgName", uniqueName+fileExtension);
		
		managerService.tripPlus(hm);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('�뿬�뻾吏� �벑濡앹씠 �셿猷뚮릺�뿀�뒿�땲�떎.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� �궘�젣 
	@RequestMapping(value="tripDt.do", method = RequestMethod.GET)
	public String tripDt(int tidx,HttpServletResponse response,HttpServletRequest req)throws Exception {
			
			managerService.tripDt(tidx);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			out.append("<script>alert('�궘�젣媛� �셿猷뚮릺�뿀�뒿�땲�떎.'); location.href='"+req.getContextPath()+"/manager/managerTrip.do';</script>"); 
			out.flush(); 
			out.close();

		return "";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� �긽�꽭�럹�씠吏� 
	@RequestMapping(value="tripInfo.do", method = RequestMethod.GET)
	public String tripInfo(int tidx, Model model) {
		
		TripVO vo = managerService.tripInfo(tidx);
		model.addAttribute("vo",vo);
		
		return "manager/managerTripInfo";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� �닔�젙�럹�씠吏� 
	@RequestMapping(value="tripMf.do", method = RequestMethod.GET)
	public String tiprMf(int tidx, Model model) {
		
		TripVO vo = managerService.tripInfo(tidx);
		
		model.addAttribute("vo",vo);
		
		return "manager/managerTripMf";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� �닔�젙 
	@RequestMapping(value="tripMf.do", method = RequestMethod.POST)
	public String tripMf(int tidx,String tName,String tAddr,String tSubContent,String tMainContent,String tLink,String tLatitude,String tLongitude,HttpServletResponse response,HttpServletRequest req, MultipartFile tImgName)throws Exception{
		
		// �깉濡쒖슫 �씠誘몄� �벑濡�
				String fileRealName = tImgName.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
				long size = tImgName.getSize(); //�뙆�씪 �궗�씠利�
					
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
				String uploadFolder = req.getSession().getServletContext().getRealPath("/resources/images/manager_images");
							
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");			
				String uniqueName = uuids[0];
				
				File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // �쟻�슜 �썑
				try {
					tImgName.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				HashMap<String,Object> hm = new HashMap<String,Object>();
				hm.put("tidx", tidx);
				hm.put("tName", tName);
				hm.put("tAddr", tAddr);
				hm.put("tSubContent", tSubContent);
				hm.put("tMainContent", tMainContent);
				hm.put("tLink", tLink);
				hm.put("tLatitude", tLatitude);
				hm.put("tLongitude", tLongitude);
				hm.put("tImgName", uniqueName+fileExtension); // (�뙆�씪誘명꽣濡� 諛쏆븘�삩 file�쓣) �쐞�뿉�꽌 泥섎━�빐�꽌 �굹�삩 �뙆�씪紐낆쓣 (db�뿉 �꽔�뼱以�) vo蹂��닔(移쇰읆)�뿉 �떞�븘以��떎

				
		managerService.tripUt(hm);
		
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.append("<script>alert('�닔�젙�씠 �셿猷뚮릺�뿀�뒿�땲�떎.'); opener.parent.location.reload(); window.close();</script>"); 
		out.flush(); 
		out.close();
		
		return "";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� 硫붿씤�벑濡앺럹�씠吏�
	@RequestMapping(value="tripRegPage.do", method = RequestMethod.GET)
	public String tripRegPage(Model model){
		
		List<TripVO> notVO = managerService.tripNotRegList();
		List<TripVO> vo = managerService.tripRegList();
		
		model.addAttribute("notVO",notVO);
		model.addAttribute("vo",vo);
		
		return "manager/managerTripMainReg";
	}
	//愿�由ъ옄 �씤湲곗뿬�뻾吏� 由ъ뒪�듃 誘몃━蹂닿린 �럹�씠吏�
	@RequestMapping(value="tripListPreview.do", method = RequestMethod.GET)
	public String tripListPreview(Model model){
		
		List<TripVO> tripList = indexService.mainTripList();
		model.addAttribute("tripList",tripList);
		
		return "manager/managerTripListPreview";
	}
	
	
	//�쐞�룄,寃쎈룄 異붿텧�쓣 �쐞�븳 吏��룄 �뙘�뾽李�
	@RequestMapping(value="mapOn.do", method = RequestMethod.GET)
	public String mapOn(){
		
		return "manager/managerMapOn";
	}
}
