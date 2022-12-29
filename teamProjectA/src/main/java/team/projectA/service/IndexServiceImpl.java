package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.IndexDAO;
import team.projectA.dao.UserDao;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.UserVO;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	private IndexDAO indexDAO;

	@Override
	public List<ReviewVO> popLodgingList() throws Exception {
		return indexDAO.popLodgingList();
	}

	@Override
	public List<ReviewVO> popLodgingList2() throws Exception {
		return indexDAO.popLodgingList2();
	}

	@Override
	public List<ReservVO> roomCount() {
		return indexDAO.roomCount();
	}
	@Override
	public int roomPlus(HashMap hm){
		return indexDAO.roomPlus(hm);
	}

	@Override
	public int roomPlus2(int ridx) {
		return indexDAO.roomPlus2(ridx);
	}

	

}
