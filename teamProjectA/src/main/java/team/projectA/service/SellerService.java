package team.projectA.service;

import java.util.HashMap;
import java.util.List;



import team.projectA.vo.LodgingVO;

import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.UserVO;

public interface SellerService {
	
	LodgingVO SellerOne(int uidx);
	
	int sellerUpdate(UserVO vo);
	
	int sellerUpdate2(LodgingVO vo);
	
    List<QnaVO> qnaList(int uidx);
   	
	int qnaInsert(QnaVO vo);
	
	UserVO qnaOne(int QnA_idx);
	
	List<RoomVO> roomlist(int uidx);
	
	int roomdel(int ridx);
	
	int roomup(RoomVO vo); 
	
	int roomInCh(RoominVO vo);
	
	LodgingVO lidxone(int uidx);
	
	int lodgingUp(LodgingVO vo);
	
	int waiting(UserVO vo);

	RoominVO roomModiInfo(int ridx);
	
	int roomModify(RoomVO vo);
	
	int roomModify2(RoominVO vo);
}
