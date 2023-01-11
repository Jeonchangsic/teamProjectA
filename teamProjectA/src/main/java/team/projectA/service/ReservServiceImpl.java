package team.projectA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.MypageDAO;
import team.projectA.dao.ReservDAO;
import team.projectA.dao.ReviewDAO;
import team.projectA.dao.SellerDao;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.UserVO;

@Service
public class ReservServiceImpl implements ReservService{
	
	@Autowired
	private ReservDAO reservDao;
	@Override
	public int reservInsert(HashMap hm) throws Exception {
		return reservDao.reservInsert(hm);
	}
	@Override
	public List<ReservVO> ridxList(int ridx) {

		return reservDao.ridxList(ridx);
	}
	
	

	


}
