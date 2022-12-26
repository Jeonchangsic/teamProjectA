package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

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


	@Override
	public int sellerUserInsert(UserVO vo) {
		return userDao.sellerUserInsert(vo);
	}


	@Override
	public int pwUpdate(HashMap hm) {
		return userDao.pwUpdate(hm);
	}


	@Override
	public int userSearch(String id) {
		return userDao.userSearch(id);
	}


	@Override
	public int reviewDt(UserVO vo) {
		return userDao.reviewDt(vo);
	}


	@Override
	public int reservDt(UserVO vo) {
		return userDao.reservDt(vo);
	}





	


}
