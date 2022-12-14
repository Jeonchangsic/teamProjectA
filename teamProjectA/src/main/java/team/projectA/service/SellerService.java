package team.projectA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.LodginginfoVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

public interface SellerService {
	
	LodgingVO SellerOne(int uidx);
	
	int sellerUpdate(UserVO vo);
	
	int sellerUpdate2(LodgingVO vo);
	
    List<QnaVO> qnaList(HashMap hm);
    
    int listCount(HashMap hm);
   	
	int qnaInsert(QnaVO vo);
	
	UserVO qnaOne(int qna_idx);

	int qnaDelete(int qna_idx);
	
	int qnaModify(QnaVO vo);
	
	List<RoomVO> roomlist(int uidx);
	
	int roomdel(int ridx);
	
	int roomup(RoomVO vo); 
	
	int roomInCh(RoominVO vo);
	
	LodgingVO lidxone(int uidx);
	
	int lodgingUp(LodgingVO vo);	
	
	int lodginginUp(LodginginVO vo);
	
	int lodginginfoUp(LodginginfoVO vo);

	int waiting(int uidx);
	
	Map<String, Object> lodgingModi(int lidx);
		
	int lodgingModify(LodgingVO vo);
	
	int lodginginModify(LodginginVO vo);
	
	int lodginginfoModify(LodginginfoVO vo);
	
	int loDel(int lidx);
	
	int N(int uidx);
	
	RoominVO roomModiInfo(int ridx);
	
	int roomModify(RoomVO vo);
	
	int roomModify2(RoominVO vo);

	List<RoomVO> ridxOnelist(int uidx);

}
