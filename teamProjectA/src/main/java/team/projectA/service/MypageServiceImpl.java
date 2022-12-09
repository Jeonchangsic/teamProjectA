package team.projectA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.MypageDAO;
import team.projectA.dao.UserDao;
import team.projectA.vo.Criteria;
import team.projectA.vo.ReservVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDao;

	@Override
	public int changePw(UserVO vo) {
		return mypageDao.changePw(vo);
	}

	
	  @Override public List<ReservVO> reserv_list()throws Exception { 
		 return mypageDao.reserv_list(); 
	}


	@Override
	public int reserv_count() throws Exception {
		return mypageDao.reserv_count();
	}


	@Override
	public List<ReservVO> listPage(Criteria cri) throws Exception {
		return mypageDao.listPage(cri);
	}
	 	
}
