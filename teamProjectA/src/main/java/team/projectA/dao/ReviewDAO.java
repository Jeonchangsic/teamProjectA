package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.ReviewVO;
import team.projectA.vo.UserVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int rvInsert(HashMap hm) {
		
		return sqlsession.insert("team.projectA.mapper.ReviewMapper.rvInsert", hm);
	}
	public int rvUpdate(int reserv_idx) {
		
		return sqlsession.update("team.projectA.mapper.ReviewMapper.rvUpdate", reserv_idx);
	}
	
}
