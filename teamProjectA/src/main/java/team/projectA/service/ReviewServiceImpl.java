package team.projectA.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.projectA.dao.ReviewDAO;
import team.projectA.dao.SellerDao;
import team.projectA.vo.LodgingVO;
import team.projectA.vo.QnaVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.UserVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public int rvInsert(ReviewVO vo) {
		return reviewDAO.rvInsert(vo);
	}

	


}