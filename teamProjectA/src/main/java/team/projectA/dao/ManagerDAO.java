package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.RoomVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession; 
	
	public List<LodgingVO> lodgingCategory() throws Exception{
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.lodgingCategory");
	}
	public List<RoomVO> selectRoomList(String lidx){
		
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.lodgingID",lidx);
	}
}