package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.FestivalVO;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.TripVO;
import team.projectA.vo.UserVO;

public interface IndexService {
	
	List<ReviewVO> popLodgingList()throws Exception;
	List<ReviewVO> popLodgingList2()throws Exception;
	List<ReservVO> roomCount();
	int roomPlus(HashMap hm);
	int roomPlus2(int ridx);
	List<FestivalVO> mainFestivalList();
	FestivalVO mainFestivalPage(int ftidx);
	List<TripVO> mainTripList();
	TripVO mainTripPage(int tidx);

}

