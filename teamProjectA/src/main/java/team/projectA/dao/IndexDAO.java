package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.ReservVO;
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
	public List<ReservVO> roomCount(){
		return sqlSession.selectList("team.projectA.mapper.IndexMapper.roomCount");
	}
	public int roomPlus(HashMap hm){
		return sqlSession.update("team.projectA.mapper.IndexMapper.roomPlus",hm);
	}
	public int roomPlus2(int ridx){
		return sqlSession.update("team.projectA.mapper.IndexMapper.roomPlus2",ridx);
	}
}
