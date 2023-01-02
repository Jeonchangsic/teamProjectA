package team.projectA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.LodgingDAO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;

@Service
public class LodgingServiceImpl implements LodgingService {

	@Autowired
	private LodgingDAO lodgingDAO; 
	
/*	@Override
	public List<LodgingVO> selectList1(String lodgingkind) {
		return lodgingDAO.selectList1(lodgingkind);
	}
	
	@Override
	public List<RoomVO> selectList2(String gubun) {		
		return lodgingDAO.selectList2(gubun);
	}
*/
	@Override
	public List<Map<String,Object>> selectLodgingList(String lodgingkind, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men) {
		return lodgingDAO.selectLodgingList(lodgingkind, type, area, rvo, linvo, rinvo, fromDate, toDate, men);
	}
	
	@Override
	public Map<String,Object> selectLodging(int lidx) {
		return lodgingDAO.selectLodging(lidx);
	}
	@Override
	public List<RoominVO> selectRoomList(int lidx, String men) {
		return lodgingDAO.selectRoomList(lidx, men);
	}

	@Override
	public RoomVO selectRoom(int ridx) {
		return lodgingDAO.selectRoom(ridx);
	}

	@Override
	public List<Map<String,Object>> listSearch(HashMap hm) throws Exception {
		return lodgingDAO.listSearch(hm);
	}
	
	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return lodgingDAO.countSearch(scri);
	}

	@Override
	public List<ReviewVO> selectReview(HashMap hm) {
		return lodgingDAO.selectReview(hm);
	}

	@Override
	public ReviewVO selectLodgingRV(int lidx) {
		return lodgingDAO.selectLodgingRV(lidx);
	}

	@Override
	public int RVCount(int lidx) {
		return lodgingDAO.RVCount(lidx);
	}



	
	

	

}