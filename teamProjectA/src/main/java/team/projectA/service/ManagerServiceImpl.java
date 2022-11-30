package team.projectA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.LodgingDAO;
import team.projectA.dao.ManagerDAO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO;

	@Override
	public List<LodgingVO> lodgingCategory()throws Exception {
		return managerDAO.lodgingCategory();
	}

	@Override
	public List<RoomVO> selectRoomList(String lidx) {
		
		
		
		return managerDAO.selectRoomList(lidx);
	}
	
	
	

	

}