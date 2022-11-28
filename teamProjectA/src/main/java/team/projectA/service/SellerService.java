package team.projectA.service;

import java.util.List;
import java.util.Map;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.UserVO;

public interface SellerService {
	
	LodgingVO SellerOne(int uidx);
	
	int sellerUpdate(UserVO vo);
	
	int sellerUpdate2(LodgingVO vo);
	
	List<QnaVO> qnaList(int uidx);
		
	int qnaInsert(QnaVO vo);
	
	UserVO qnaOne(int QnA_idx);
}
