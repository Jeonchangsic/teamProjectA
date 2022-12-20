package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;

public interface LodgingService {
/*	List<LodgingVO> selectList1(String lodgingkind);
	List<RoomVO> selectList2(String gubun);
*/
	List<RoomVO> selectLodgingList(String lodgingkind, String type, String area);
	List<RoomVO> selectListSearch(String type);
	LodgingVO selectLodging(int lidx); 
	List<RoominVO> selectRoomList(int lidx); 
	RoomVO selectRoom(int ridx);
	List<RoomVO> listSearch(HashMap hm)throws Exception;
	int countSearch(SearchCriteria scri)throws Exception;
}