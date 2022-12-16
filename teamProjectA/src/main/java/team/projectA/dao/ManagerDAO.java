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
import team.projectA.vo.RoomVO;
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
	public List<ReservVO> reservlist(ReservVO vo1){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.reservlist", vo1);
	}
	public List<QnaVO> managerqnalist(){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.managerqnalist");
	}
	public int qnaReply(QnaVO qv) {
		return sqlSession.update("team.projectA.mapper.ManagerMapper.qnaReply", qv);
	}
}