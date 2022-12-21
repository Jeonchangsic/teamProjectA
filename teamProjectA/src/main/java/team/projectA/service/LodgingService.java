package team.projectA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;

public interface LodgingService {
/*	List<LodgingVO> selectList1(String lodgingkind);
	List<RoomVO> selectList2(String gubun);
*/
	List<Map<String,Object>> selectLodgingList(String lodgingkind, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo);
	List<RoomVO> selectListSearch(String type);
	Map<String,Object> selectLodging(int lidx); 
	List<RoominVO> selectRoomList(int lidx); 
	RoomVO selectRoom(int ridx);
	List<ReviewVO> selectReview(int lidx);
	List<RoomVO> listSearch(HashMap hm)throws Exception;
	int countSearch(SearchCriteria scri)throws Exception;
}