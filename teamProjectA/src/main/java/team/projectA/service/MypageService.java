package team.projectA.service;

import java.util.List;

import team.projectA.vo.Criteria;
import team.projectA.vo.ReservVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

public interface MypageService {
	int changePw(UserVO vo);
	List<ReservVO>reserv_list()throws Exception;
	int reserv_count()throws Exception;
	List<ReservVO> listPage(Criteria cri)throws Exception;
	
}
