package team.projectA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.UserDao;
import team.projectA.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	

	@Override
	public int userInsert(UserVO vo) {
		return userDao.userInsert(vo);
	}


	@Override
	public int userForm(String userID) {
		return userDao.userForm(userID);
	}


	@Override
	public UserVO login(UserVO vo) {
		return userDao.login(vo);
	}


	@Override
	public int userDt(UserVO vo) {
		return userDao.userDt(vo);
	}


	@Override
	public List<UserVO> userList(UserVO vo) {
		
		return userDao.userList(vo);
	}

}
