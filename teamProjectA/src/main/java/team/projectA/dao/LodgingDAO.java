package team.projectA.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

@Repository
public class LodgingDAO {

	@Autowired
	private SqlSession sqlSession; 
	
	public List<LodgingVO> selectList1(String lodgingkind){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectList1",lodgingkind);
	}
	
	public List<LodgingVO> selectListSearch(LodgingVO vo){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectListSearch",vo);
	}
	
	public List<RoomVO> selectList2(RoomVO vo){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectList2",vo);
	}
	
	public LodgingVO selectLodging(String lidx) {
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.selectLodging",lidx);
	}
	
	public List<RoomVO> selectRoomList(String lidx){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectRoomList",lidx);
	}
	
	
	
	
}