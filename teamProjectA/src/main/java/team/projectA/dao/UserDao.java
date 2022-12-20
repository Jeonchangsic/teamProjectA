package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.UserVO;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlsession;
	//ȸ������
	public int userInsert(UserVO vo) {
		return sqlsession.insert("team.projectA.mapper.UserMapper.userInsert", vo);
	}
	//�Ǹ��� ȸ������
	public int sellerUserInsert(UserVO vo) {
		return sqlsession.insert("team.projectA.mapper.UserMapper.sellerUserInsert", vo);
	}
	
	//���̵� �ߺ�Ȯ��
	public int userForm(String userID) {
		return sqlsession.selectOne("team.projectA.mapper.UserMapper.userForm", userID);
	}
	public UserVO login(UserVO vo) {
		return sqlsession.selectOne("team.projectA.mapper.UserMapper.login",vo);
	}
	//ȸ��Ż��
	public int userDt(UserVO vo) {
		return sqlsession.delete("team.projectA.mapper.UserMapper.userDt", vo);
	}
	//ȸ������Ʈ
	public List<UserVO> userList(UserVO vo){
		return sqlsession.selectList("team.projectA.mapper.UserMapper.userlist",vo);
			
	}
	//아이디 존재 여부 
	public int userSearch(String id){
		return sqlsession.selectOne("team.projectA.mapper.UserMapper.userSearch",id);
			
	}
	//비밀번호 찾기
	public int pwUpdate(HashMap hm){
		return sqlsession.update("team.projectA.mapper.UserMapper.pwUpdate",hm);
	}
}
