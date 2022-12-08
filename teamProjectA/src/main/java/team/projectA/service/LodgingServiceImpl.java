package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.LodgingDAO;
import team.projectA.vo.LodgingVO;
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
	public List<RoomVO> selectLodgingList(String lodgingkind, String type, String area) {
		return lodgingDAO.selectLodgingList(lodgingkind, type, area);
	}

	@Override
	public List<RoomVO> selectListSearch(String type) {
		return lodgingDAO.selectListSearch(type);
	}
	
	@Override
	public LodgingVO selectLodging(String lidx) {
		return lodgingDAO.selectLodging(lidx);
	}
	@Override
	public List<RoomVO> selectRoomList(String lidx) {
		return lodgingDAO.selectRoomList(lidx);
	}

	@Override
	public RoomVO selectRoom(String ridx) {
		return lodgingDAO.selectRoom(ridx);
	}

	@Override
	public List<RoomVO> listSearch(HashMap hm) throws Exception {
		return lodgingDAO.listSearch(hm);
	}
	
	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return lodgingDAO.countSearch(scri);
	}



	
	

	

}