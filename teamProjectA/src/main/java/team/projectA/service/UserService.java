package team.projectA.service;

import team.projectA.vo.UserVO;

public interface UserService {
	int userInsert(UserVO vo);
	int userForm(String userID);
	UserVO login(UserVO vo);
	int userDt(UserVO vo);
}
