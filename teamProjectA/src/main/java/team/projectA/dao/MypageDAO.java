package team.projectA.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.UserVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int changePw(UserVO vo) {
		return sqlsession.update("team.projectA.mapper.MypageMapper.changePw", vo);
	}
}