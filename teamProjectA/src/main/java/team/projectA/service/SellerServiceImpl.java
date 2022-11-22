package team.projectA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.SellerDao;
import team.projectA.vo.LodgingVO;

import team.projectA.vo.UserVO;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao SellerDao;

	@Override
	public UserVO SellerOne(int uidx) {
		
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







}
