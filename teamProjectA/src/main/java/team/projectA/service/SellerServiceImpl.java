package team.projectA.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.SellerDao;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.UserVO;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao SellerDao;

	@Override
	public LodgingVO SellerOne(String uidx) {
		
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
	public int qnaInsert(QnaVO vo) {
	
		return SellerDao.qnaInsert(vo);
	}

	@Override
	public UserVO qnaOne(int uidx) {

		return SellerDao.qnaOne(uidx);
	}









}
