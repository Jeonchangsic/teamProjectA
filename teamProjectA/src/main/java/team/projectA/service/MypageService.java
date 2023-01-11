package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.Criteria;
import team.projectA.vo.ReservVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

public interface MypageService {
	int changePw(HashMap hm);
	List<ReservVO>reserv_list()throws Exception;
	int reserv_count()throws Exception;
	List<ReservVO> listPage(HashMap hm)throws Exception;
	int reserv_refund(ReservVO rvo);
	ReservVO reservListPop(HashMap hm)throws Exception;
	List<ReviewVO>reviewList(HashMap hm2)throws Exception;
	int reviewDt(int rvidx);
	ReviewVO reviewList2(int rvidx)throws Exception;
	int review_count()throws Exception;
}
