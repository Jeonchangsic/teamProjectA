package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.PagingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

public interface ManagerService {
	public List<LodgingVO> lodgingCategory()throws Exception;
	public List<RoomVO> selectRoomList(int lidx);
	public List<LodgingVO> requestList();
	public int approval(int uidx);
	public int requestDel(int lidx);
	public int requestN(int uidx);
	public List<ReservVO> reservlist(ReservVO vo1);
	public int reservcount();
	public List<QnaVO> managerqnalist();
	public int qnaReply(HashMap hm);
	int userlistCount();
	List<UserVO> muserList(HashMap hm1);
	List<ReviewVO> ReviewList(SearchCriteria scri3);
	public int reviewcount();
	int reviewDelete(int rvidx);
	ReviewVO reviewOne(int rvidx);
	public List<QnaVO> qnaList(SearchCriteria scri2);
	public int qnacount();
	public List<LodgingVO> managerRoomList(SearchCriteria scri2);
	public int RoomListcount();  
}