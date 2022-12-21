package team.projectA.service;

import java.util.HashMap;
import java.util.List;

import team.projectA.vo.ReviewVO;
import team.projectA.vo.UserVO;

public interface IndexService {
	
	List<ReviewVO> popLodgingList()throws Exception;
}

