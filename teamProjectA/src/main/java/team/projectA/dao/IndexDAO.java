package team.projectA.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.ReviewVO;



@Repository
public class IndexDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<ReviewVO> popLodgingList() throws Exception{
		return sqlSession.selectList("team.projectA.mapper.IndexMapper.popLodgingList");
	}
	public List<ReviewVO> popLodgingList2() throws Exception{
		return sqlSession.selectList("team.projectA.mapper.IndexMapper.popLodgingList");
	}
	
}
