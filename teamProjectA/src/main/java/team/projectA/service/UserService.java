package team.projectA.service;

import java.util.List;

import team.projectA.vo.PagingVO;
import team.projectA.vo.UserVO;

public interface UserService {
	int userInsert(UserVO vo);
	int userForm(String userID);
	UserVO login(UserVO vo);
	int userDt(UserVO vo);
	public List<UserVO> userList(UserVO vo);
	public int countUser(UserVO vo2);
	// 페이징 처리 회원리스트 조회
	public List<UserVO> selectUserList(PagingVO vo1);
}
