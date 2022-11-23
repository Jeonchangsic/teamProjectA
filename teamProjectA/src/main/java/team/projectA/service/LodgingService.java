package team.projectA.service;

import java.util.List;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

public interface LodgingService {
	List<LodgingVO> selectList1(String lodgingkind);
	List<LodgingVO> selectListSearch(LodgingVO vo);
	List<RoomVO> selectList2(RoomVO vo);
	LodgingVO selectLodging(String lidx); 
	List<RoomVO> selectRoomList(String lidx); 
}