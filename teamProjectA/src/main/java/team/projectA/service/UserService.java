package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.UserVO;

public interface UserService {
	int userInsert(UserVO vo);
	int sellerUserInsert(UserVO vo);
	int userForm(String userID);
	UserVO login(UserVO vo);
	int userDt(UserVO vo);
	public List<UserVO> userList(UserVO vo);
	int pwUpdate(HashMap hm);
	int userSearch(String id);
}
