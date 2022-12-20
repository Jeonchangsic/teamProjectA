package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.MypageDAO;
import team.projectA.dao.UserDao;
import team.projectA.vo.Criteria;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDao;

	@Override
	public int changePw(HashMap hm) {
		return mypageDao.changePw(hm);
	}
	@Override 
	public List<ReservVO> reserv_list()throws Exception { 
		return mypageDao.reserv_list(); 
	}
	@Override
	public int reserv_count() throws Exception {
		return mypageDao.reserv_count();
	}
	@Override
	public List<ReservVO> listPage(HashMap hm) throws Exception {
		return mypageDao.listPage(hm);
	}
	@Override
	public ReservVO reservListPop(HashMap hm) throws Exception {
		return mypageDao.reservListPop(hm);
	}
	@Override
	public int reserv_refund(ReservVO rvo) {
		return mypageDao.reserv_refund(rvo);
	}
	@Override
	public List<ReviewVO> reviewList(int uidx)throws Exception {
		return mypageDao.reviewList(uidx);
	}
	@Override
	public int reviewDt(int rvidx) {
		return mypageDao.reviewDt(rvidx);
	}
	@Override
	public ReviewVO reviewList2(int rvidx) throws Exception {
		return mypageDao.reviewList2(rvidx);
	}
	
	
}
