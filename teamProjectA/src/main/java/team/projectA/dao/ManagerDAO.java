
package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.FestivalVO;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.PagingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.TripVO;
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
	
	
	
	public List<FestivalVO> festivalList(SearchCriteria scri){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.festivalList",scri);
	}
	public int festivalCnt() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.festivalCnt");
	}
	public int festivalPlus(HashMap hm){
		return sqlSession.insert("team.projectA.mapper.ManagerMapper.festivalPlus",hm);
	}
	public int festivalDt(int ftidx){
		return sqlSession.delete("team.projectA.mapper.ManagerMapper.festivalDt",ftidx);
	}
	public FestivalVO festivalInfo(int ftidx){
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.festivalInfo",ftidx);
	}
	public int festivalUt(FestivalVO festivalVO){
		return sqlSession.update("team.projectA.mapper.ManagerMapper.festivalUt",festivalVO);
	}
	public List<FestivalVO> festivalNotRegList(){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.festivalNotRegList");
	}
	public List<FestivalVO> festivalRegList(){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.festivalRegList");
	} 
	public int festivalReg(int ftidx){
		return sqlSession.update("team.projectA.mapper.ManagerMapper.festivalReg",ftidx);
	}
	public int festivalRegDt(int ftidx){
		return sqlSession.update("team.projectA.mapper.ManagerMapper.festivalRegDt",ftidx);
	}
	
	
	public List<TripVO> tripList(SearchCriteria TripScri){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.tripList",TripScri);
	}
	public int tripCnt() {
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.tripCnt");
	}
	public int tripPlus(HashMap hm){
		return sqlSession.insert("team.projectA.mapper.ManagerMapper.tripPlus",hm);
	}
	public int tripDt(int tidx){
		return sqlSession.delete("team.projectA.mapper.ManagerMapper.tripDt",tidx);
	}
	public TripVO tripInfo(int tidx){
		return sqlSession.selectOne("team.projectA.mapper.ManagerMapper.tripInfo",tidx);
	}
	public int tripUt(TripVO tripVO){
		return sqlSession.update("team.projectA.mapper.ManagerMapper.tripUt",tripVO);
	}
	public List<TripVO> tripNotRegList(){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.tripNotRegList");
	}
	public List<TripVO> tripRegList(){
		return sqlSession.selectList("team.projectA.mapper.ManagerMapper.tripRegList");
	}
	public int tripReg(int tidx){
		return sqlSession.update("team.projectA.mapper.ManagerMapper.tripReg",tidx);
	}
	public int tripRegDt(int tidx){
		return sqlSession.update("team.projectA.mapper.ManagerMapper.tripRegDt",tidx);
	}
}