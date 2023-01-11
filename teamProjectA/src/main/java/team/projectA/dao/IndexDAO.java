package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.FestivalVO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.TripVO;



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
	public List<FestivalVO> mainFestivalList(){
		return sqlSession.selectList("team.projectA.mapper.IndexMapper.mainFestivalList");
	}
	public FestivalVO mainFestivalPage(int ftidx) {
		return sqlSession.selectOne("team.projectA.mapper.IndexMapper.mainFestivalPage",ftidx);
	}
	public List<TripVO> mainTripList(){
		return sqlSession.selectList("team.projectA.mapper.IndexMapper.mainTripList");
	}
	public TripVO mainTripPage(int tidx) {
		return sqlSession.selectOne("team.projectA.mapper.IndexMapper.mainTripPage",tidx);
	}
}
