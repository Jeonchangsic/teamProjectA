package team.projectA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.LodgingDAO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

@Service
public class LodgingServiceImpl implements LodgingService {

	@Autowired
	private LodgingDAO lodgingDAO; 
	
	@Override
	public List<LodgingVO> selectList1(String lodgingkind) {
		return lodgingDAO.selectList1(lodgingkind);
	}
	@Override
	public List<LodgingVO> selectListSearch(LodgingVO vo) {
		return lodgingDAO.selectListSearch(vo);
	}
	@Override
	public List<RoomVO> selectList2(RoomVO vo) {		
		return lodgingDAO.selectList2(vo);
	}
	
	@Override
	public LodgingVO selectLodging(String lidx) {
		return lodgingDAO.selectLodging(lidx);
	}
	@Override
	public List<RoomVO> selectRoomList(String lidx) {
		return lodgingDAO.selectRoomList(lidx);
	}

	

	

}