package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.LodgingDAO;
import team.projectA.dao.ManagerDAO;
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

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO;

	@Override
	public List<LodgingVO> lodgingCategory()throws Exception {
		return managerDAO.lodgingCategory();
	}

	@Override
	public List<RoomVO> selectRoomList(int lidx) {
		
		 managerDAO.selectRoomList(lidx);
		
		
		return managerDAO.selectRoomList(lidx);
	}

	@Override
	public List<LodgingVO> requestList() {
		return managerDAO.requestList();
	}

	@Override
	public int approval(int uidx) {
		return managerDAO.approval(uidx);
	}

	@Override
	public int requestDel(int lidx) {
		return managerDAO.requestDel(lidx);
	}

	@Override
	public int requestN(int uidx) {
		return managerDAO.requestN(uidx);
	}

	@Override
	public List<ReservVO> reservlist(SearchCriteria scri4) {
		
		return managerDAO.reservlist(scri4);
	}

	@Override
	public List<QnaVO> managerqnalist() {
		
		return managerDAO.managerqnalist();
	}

	@Override
	public int qnaReply(HashMap hm) {
		
		return managerDAO.qnaReply(hm);
	}

	@Override
	public int userlistCount() {
	
		return managerDAO.userlistCount();
	}

	@Override
	public List<UserVO> muserList(HashMap hm1) {
		
		return managerDAO.muserList(hm1);
	}

	@Override
	public List<ReviewVO> ReviewList(SearchCriteria scri3) {
		
		return managerDAO.ReviewList(scri3);
	}

	@Override
	public int reviewDelete(int rvidx) {
		
		return managerDAO.reviewDelete(rvidx);
	}

	@Override
	public ReviewVO reviewOne(int rvidx) {
		
		return managerDAO.reviewOne(rvidx);
	}
	@Override
	public List<QnaVO> qnaList(SearchCriteria scri) {
		
		return managerDAO.qnaList(scri);
	}

	@Override
	public int qnacount() {
		
		return managerDAO.qnacount();
	}

	@Override
	public List<LodgingVO> managerRoomList(SearchCriteria scri2) {
		
		return managerDAO.managerRoomList(scri2);
	}

	@Override
	public int RoomListcount() {
		
		return managerDAO.RoomListcount();
	}

	@Override
	public int reviewcount() {
		
		return managerDAO.reviewcount();
	}

	@Override
	public int reservcount() {

		return managerDAO.reservcount();    
	}

	@Override
	public int festivalPlus(HashMap hm) {
		return managerDAO.festivalPlus(hm);
	}

	@Override
	public int tripPlus(HashMap hm) {
		return managerDAO.tripPlus(hm);
	}

	@Override
	public int festivalDt(int ftidx) {
		return managerDAO.festivalDt(ftidx);
	}

	@Override
	public int tripDt(int tidx) {
		return managerDAO.tripDt(tidx);
	}

	@Override
	public FestivalVO festivalInfo(int ftidx) {
		return managerDAO.festivalInfo(ftidx);
	}

	@Override
	public TripVO tripInfo(int tidx) {
		return managerDAO.tripInfo(tidx);
	}

	@Override
	public int festivalUt(FestivalVO festivalVO) {
		return managerDAO.festivalUt(festivalVO);
	}

	@Override
	public int tripUt(TripVO tripVO) {
		return managerDAO.tripUt(tripVO);
	}

	@Override
	public List<FestivalVO> festivalNotRegList() {
		return managerDAO.festivalNotRegList();
	}

	@Override
	public List<FestivalVO> festivalRegList() {
		return managerDAO.festivalRegList();
	}

	@Override
	public List<TripVO> tripNotRegList() {
		return managerDAO.tripNotRegList();
	}

	@Override
	public List<TripVO> tripRegList() {
		return managerDAO.tripRegList();
	}

	@Override
	public int festivalReg(int ftidx) {
		return managerDAO.festivalReg(ftidx);
	}

	@Override
	public int tripReg(int tidx) {
		return managerDAO.tripReg(tidx);
	}

	@Override
	public int festivalRegDt(int ftidx) {
		return managerDAO.festivalRegDt(ftidx);
	}

	@Override
	public int tripRegDt(int tidx) {
		return managerDAO.tripRegDt(tidx);
	}

	@Override
	public List<FestivalVO> festivalList(SearchCriteria scri) {
		return managerDAO.festivalList(scri);
	}

	@Override
	public int festivalCnt() {
		return managerDAO.festivalCnt();
	}

	@Override
	public List<TripVO> tripList(SearchCriteria TripScri) {
		return managerDAO.tripList(TripScri);
	}

	@Override
	public int tripCnt() {
		return managerDAO.tripCnt();
	}

	

}
