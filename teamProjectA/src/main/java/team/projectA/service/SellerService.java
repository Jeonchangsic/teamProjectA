package team.projectA.service;

import team.projectA.vo.LodgingVO;

import team.projectA.vo.UserVO;

public interface SellerService {
	
	UserVO SellerOne(int uidx);
	
	int sellerUpdate(UserVO vo);
	
	int sellerUpdate2(LodgingVO vo);
}
