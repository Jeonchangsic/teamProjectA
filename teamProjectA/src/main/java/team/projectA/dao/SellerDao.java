package team.projectA.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.LodginginfoVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
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
	
	public List<QnaVO> qnaList(HashMap hm){
        return sqlSession.selectList("team.projectA.mapper.sellerMapper.qnaList", hm);
	 }
	
	public int listCount() {
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.listCount");
		
	}
	    	
	public int qnaInsert(QnaVO vo) {
		return sqlSession.insert("team.projectA.mapper.sellerMapper.qnaInsert", vo);
			
	}
	
	public QnaVO qnaOne(int qna_idx) {
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.qnaOne", qna_idx);
	}
	
	public int qnaDelete(int qna_idx) {
		return sqlSession.delete("team.projectA.mapper.sellerMapper.qnaDelete", qna_idx);
	}
	
	public int qnaModify(QnaVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.qnaModify", vo);
	}

	public List<RoomVO> roomlist(int uidx) {
		return sqlSession.selectList("team.projectA.mapper.sellerMapper.roomlist", uidx);
		
	}
	
	public int roomdel(int ridx) {
		return sqlSession.delete("team.projectA.mapper.sellerMapper.roomdel", ridx);
		
	}
	
	@Transactional
	public int roomup(RoomVO vo) {
		
		sqlSession.insert("team.projectA.mapper.sellerMapper.roomup",vo);
		return vo.getRidx();		
	}
	
	public int roomInCh(RoominVO vo) {

		return sqlSession.insert("team.projectA.mapper.sellerMapper.roomInCh",vo);
		
	}
		
	public LodgingVO lidxone(int uidx){
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.lidxone",uidx);
		
	}
	
	public int lodgingUp(LodgingVO vo) {
		
		sqlSession.insert("team.projectA.mapper.sellerMapper.lodgingUp", vo);
		return vo.getLidx();
	}

	public int waiting(int uidx) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.waiting", uidx);
	}
	
	public int lodginginUp(LodginginVO vo) {
		return sqlSession.insert("team.projectA.mapper.sellerMapper.lodginginUp", vo);
	}
	
	public int lodginginfoUp(LodginginfoVO vo) {
		return sqlSession.insert("team.projectA.mapper.sellerMapper.lodginginfoUp", vo);
	}
	
	public LodgingVO lodgingModi(int lidx) {
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.lodgingModi", lidx);
	}
	
	public RoominVO roomModiInfo(int ridx) {
		return sqlSession.selectOne("team.projectA.mapper.sellerMapper.roomModiInfo", ridx);
	}
	
	public int roomModify(RoomVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.roomModify", vo);
	}
	
	public int roomModify2(RoominVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.roomModify2", vo);
	}


}


