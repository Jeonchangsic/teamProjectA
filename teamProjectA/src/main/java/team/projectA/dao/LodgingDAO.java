package team.projectA.dao;

import java.util.HashMap;
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
	
/*	public List<LodgingVO> selectList1(String lodgingkind){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectList1",lodgingkind);
	}
	
	public List<RoomVO> selectList2(String gubun){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectList2", gubun);
	}
*/	
	public List<RoomVO> selectLodgingList(String lodgingkind, String type){
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lodgingkind",lodgingkind);
		hm.put("type", type);		
		
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectLodgingList",hm);
	}
	
	public List<RoomVO> selectListSearch(String type){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectListSearch",type);
	}
	
	public LodgingVO selectLodging(String lidx) {
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.selectLodging",lidx);
	}
	
	public List<RoomVO> selectRoomList(String lidx){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectRoomList",lidx);
	}
	
	
	
	
}