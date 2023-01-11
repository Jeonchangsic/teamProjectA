package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.SearchCriteria;

public interface ReservService {
	int reservInsert(HashMap hm)throws Exception;
	
	List<ReservVO> ridxList(int ridx);
	
}