package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.LodgingDAO;
import team.projectA.dao.ManagerDAO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.PagingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO;

	@Override
	public List<LodgingVO> lodgingCategory()throws Exception {
		return managerDAO.lodgingCategory();
	}

	@Override
	public List<RoomVO> selectRoomList(int lidx) {
		
		 managerDAO.selectRoomList(lidx);
		
		
		return managerDAO.selectRoomList(lidx);
	}

	@Override
	public List<LodgingVO> requestList() {
		return managerDAO.requestList();
	}

	@Override
	public int approval(int uidx) {
		return managerDAO.approval(uidx);
	}

	@Override
	public int requestDel(int lidx) {
		return managerDAO.requestDel(lidx);
	}

	@Override
	public int requestN(int uidx) {
		return managerDAO.requestN(uidx);
	}

	@Override
	public List<ReservVO> reservlist(ReservVO vo1) {
		
		return managerDAO.reservlist(vo1);
	}

	@Override
	public List<QnaVO> managerqnalist() {
		
		return managerDAO.managerqnalist();
	}

	@Override
	public int qnaReply(HashMap hm) {
		
		return managerDAO.qnaReply(hm);
	}
	
	

}