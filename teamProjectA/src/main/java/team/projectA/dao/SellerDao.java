package team.projectA.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO; 
import team.projectA.vo.UserVO;

@Repository
public class SellerDao {
	
	@Autowired
	private SqlSession sqlSession;


	public UserVO SellerOne(int uidx) {
			return sqlSession.selectOne("team.projectA.mapper.sellerMapper.SellerOne", uidx);
	}
	
	public int sellerUpdate(UserVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.sellerUpdate", vo);
	}

	public int sellerUpdate2(LodgingVO vo) {
		return sqlSession.update("team.projectA.mapper.sellerMapper.sellerUpdate2", vo);
		
	}



}
