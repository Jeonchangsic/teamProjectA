package team.projectA.service;

import java.util.List;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

public interface ManagerService {
	public List<LodgingVO> lodgingCategory()throws Exception;
	public List<RoomVO> selectRoomList(String lidx);
}