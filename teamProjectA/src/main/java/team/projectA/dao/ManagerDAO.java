
package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.PagingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession; 
	
	public List<LodgingVO> lodgingCategory() throws Exception{
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.lodgingCategory");
	}
	public List<RoomVO> selectRoomList(int lidx){
		
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.lodgingID",lidx);
	}
	public List<LodgingVO> requestList() {
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.requestList");
	}
	public int approval(int uidx) {
		return sqlSession.update("team.projectA.mapper.ManagerMapper.approval", uidx);
	}
	public int requestDel(int lidx) {
		return sqlSession.delete("team.projectA.mapper.ManagerMapper.requestDel", lidx);
	}
	public int requestN(int uidx) {
		return sqlSession.update("team.projectA.mapper.ManagerMapper.requestN", uidx);
	}
	public List<ReservVO> reservlist(SearchCriteria scri4){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.reservlist", scri4);
	}
	public int reservcount() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.reservcount");
	}
	public List<QnaVO> managerqnalist(){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.managerqnalist");
	}
	public int qnaReply(HashMap hm) {
		return sqlSession.update("team.projectA.mapper.ManagerMapper.qnaReply", hm);
	}
	public int userlistCount() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.userlistCount");
	}
	public List<UserVO> muserList(HashMap hm1){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.muserList", hm1);
	}
	public List<ReviewVO> ReviewList(SearchCriteria scri3){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.ReviewList",scri3);
		
	}
	public int reviewcount() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.reviewcount");
	}
	public int reviewDelete(int rvidx) {
		return sqlSession.delete("team.projectA.mapper.ManagerMapper.reviewDelete", rvidx);
	}
	public ReviewVO reviewOne(int rvidx) {
		
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.reviewOne", rvidx);
	}
	public List<QnaVO> qnaList(SearchCriteria scri){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.qnaList", scri);
	}
	
	public int qnacount() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.qnacount");
	}
	public List<LodgingVO> managerRoomList(SearchCriteria scri2){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.managerRoomList",scri2);
	}
	public int RoomListcount() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.RoomListcount");
	}    
}