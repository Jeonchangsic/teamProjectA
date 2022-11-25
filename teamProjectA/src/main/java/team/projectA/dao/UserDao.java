package team.projectA.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.PagingVO;
import team.projectA.vo.UserVO;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int userInsert(UserVO vo) {
		return sqlsession.insert("team.projectA.mapper.UserMapper.userInsert", vo);
	}
	
	//아이디 중복확인
	public int userForm(String userID) {
		return sqlsession.selectOne("team.projectA.mapper.UserMapper.userForm", userID);
	}
	public UserVO login(UserVO vo) {
		return sqlsession.selectOne("team.projectA.mapper.UserMapper.login",vo);
	}
	//회원탈퇴
	public int userDt(UserVO vo) {
		return sqlsession.delete("team.projectA.mapper.UserMapper.userDt", vo);
	}
	//회원리스트
		public List<UserVO> userList(UserVO vo){
			return sqlsession.selectList("team.projectA.mapper.UserMapper.userlist",vo);
			
		}
	
}
