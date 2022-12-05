package team.projectA.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import team.projectA.vo.LodgingVO;

import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;

@Repository
public class SellerDao {
	
	@Autowired
	private SqlSession sqlSession;


	public LodgingVO SellerOne(int uidx) {
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.SellerOne", uidx);
	}
	
	public int sellerUpdate(UserVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.sellerUpdate", vo);
	}

	public int sellerUpdate2(LodgingVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.sellerUpdate2", vo);
		 
	}
	
	public List<QnaVO> qnaList(int uidx){
	        
	    return sqlSession.selectList("team.projectA.mapper.sellerMapper.qnaList", uidx);
	 }
	    
	
	
	public int qnaInsert(QnaVO vo) {
		return sqlSession.insert("team.projectA.mapper.sellerMapper.qnaInsert", vo);
			
	}
	
	public QnaVO qnaOne(int QnA_idx) {
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.qnaOne", QnA_idx);
	}
	
	public List<RoomVO> roomlist(int uidx) {
		return sqlSession.selectList("team.projectA.mapper.sellerMapper.roomlist", uidx);
		
	}
	
	public int roomup(RoomVO vo) {
		return sqlSession.insert("team.projectA.mapper.sellerMapper.roomup",vo);
		
	}
	
	
}


