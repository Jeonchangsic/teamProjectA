package team.projectA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.MypageDAO;
import team.projectA.dao.UserDao;
import team.projectA.vo.UserVO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDao;

	@Override
	public int changePw(UserVO vo) {
		return mypageDao.changePw(vo);
	}

	
	

	

}
