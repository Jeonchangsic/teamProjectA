package team.projectA.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.SellerDao;
import team.projectA.vo.Criteria;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.LodginginfoVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.UserVO;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao SellerDao;

	@Override
	public LodgingVO SellerOne(int uidx) {
		
		return SellerDao.SellerOne(uidx);
	}

	@Override
	public int sellerUpdate(UserVO vo) {
		
		return SellerDao.sellerUpdate(vo);
	}

	@Override
	public int sellerUpdate2(LodgingVO vo) {
		
		return SellerDao.sellerUpdate2(vo);
	}

    @Override
    public List<QnaVO> qnaList(int uidx) {
    
        return SellerDao.qnaList(uidx);
    }
    
	@Override
	public List<QnaVO> QnaPaging(Criteria cri) {

		return SellerDao.QnaPaging(cri);
	}
	
	@Override
	public int listCount() {

		return SellerDao.listCount();
	}


	@Override
	public int qnaInsert(QnaVO vo) {
	
		return SellerDao.qnaInsert(vo);
	}

	@Override
	public UserVO qnaOne(int QnA_idx) {
 
		return SellerDao.qnaOne(QnA_idx);
	}

	@Override
	public List<RoomVO> roomlist(int uidx) {

		return SellerDao.roomlist(uidx);
	}
	
	@Override
	public int roomdel(int ridx) {
	
		return SellerDao.roomdel(ridx);
	}


	@Override
	public int roomup(RoomVO vo) {
		
		return SellerDao.roomup(vo);
	}

	@Override
	public LodgingVO lidxone(int uidx) {
	
		return SellerDao.lidxone(uidx);
	}

	@Override
	public int roomInCh(RoominVO vo) {

		return SellerDao.roomInCh(vo);
	}

	@Override
	public int lodgingUp(LodgingVO vo) {
		return SellerDao.lodgingUp(vo);
	}
	
	@Override
	public int lodginginUp(LodginginVO vo) {
		return SellerDao.lodginginUp(vo);
	}
	
	@Override
	public int lodginginfoUp(LodginginfoVO vo) {
		return SellerDao.lodginginfoUp(vo);
	}

	@Override
	public int waiting(int uidx) {
		return SellerDao.waiting(uidx);
	}

	@Override
	public RoominVO roomModiInfo(int ridx) {
		return SellerDao.roomModiInfo(ridx);
	}

	@Override
	public int roomModify(RoomVO vo) {

		return SellerDao.roomModify(vo);
	}

	@Override
	public int roomModify2(RoominVO vo) {

		return SellerDao.roomModify2(vo);
	}

	@Override
	public LodgingVO lodgingModi(int lidx) {
		return SellerDao.lodgingModi(lidx);
	}

	@Override
	public int qnaDelete(int QnA_idx) {
	      
		return SellerDao.qnaDelete(QnA_idx);
	}










	
}

