package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.IndexDAO;
import team.projectA.dao.UserDao;
import team.projectA.vo.FestivalVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.TripVO;
import team.projectA.vo.UserVO;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	private IndexDAO indexDAO;

	@Override
	public List<ReviewVO> popLodgingList() throws Exception {
		return indexDAO.popLodgingList();
	}

	@Override
	public List<ReviewVO> popLodgingList2() throws Exception {
		return indexDAO.popLodgingList2();
	}

	@Override
	public List<FestivalVO> mainFestivalList() {
		return indexDAO.mainFestivalList();
	}

	@Override
	public List<TripVO> mainTripList() {
		return indexDAO.mainTripList();
	}

	@Override
	public FestivalVO mainFestivalPage(int ftidx) {
		return indexDAO.mainFestivalPage(ftidx);
	}

	@Override
	public TripVO mainTripPage(int tidx) {
		return indexDAO.mainTripPage(tidx);
	}

	

}
