package team.projectA.service;

import java.util.HashMap;
import java.util.List;



import team.projectA.vo.LodgingVO;

import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.UserVO;

public interface SellerService {
	
	LodgingVO SellerOne(int uidx);
	
	int sellerUpdate(UserVO vo);
	
	int sellerUpdate2(LodgingVO vo);
	
    List<QnaVO> qnaList(int uidx);
   	
	int qnaInsert(QnaVO vo);
	
	UserVO qnaOne(int QnA_idx);
	
	List<RoomVO> roomlist(int uidx);
	

}
