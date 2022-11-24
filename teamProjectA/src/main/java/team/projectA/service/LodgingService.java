package team.projectA.service;

import java.util.List;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

public interface LodgingService {
/*	List<LodgingVO> selectList1(String lodgingkind);
	List<RoomVO> selectList2(String gubun);
*/
	List<RoomVO> selectLodgingList(String lodgingkind, String type);
	List<RoomVO> selectListSearch(String type);
	LodgingVO selectLodging(String lidx); 
	List<RoomVO> selectRoomList(String lidx); 
}