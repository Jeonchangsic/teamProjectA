package team.projectA.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.LodgingVO;
import team.projectA.vo.LodginginVO;
import team.projectA.vo.ReviewVO;
import team.projectA.vo.RoomVO;
import team.projectA.vo.RoominVO;
import team.projectA.vo.SearchCriteria;

@Repository
public class LodgingDAO {

	@Autowired
	private SqlSession sqlSession; 
	
/*	public List<LodgingVO> selectList1(String lodgingkind){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectList1",lodgingkind);
	}
	
	public List<RoomVO> selectList2(String gubun){
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectList2", gubun);
	}
*/	
	public List<Map<String,Object>> selectLodgingList(String lodgingkind, String type, String area, RoomVO rvo, LodginginVO linvo, RoominVO rinvo, String fromDate, String toDate, String men){
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lodgingkind",lodgingkind);
		hm.put("type", type);		
		hm.put("area", area);
		hm.put("bedArr", rvo.getBedArr());
		hm.put("roomspa", rinvo.getRoomspa());
		hm.put("wifi", rinvo.getWifi());
		hm.put("tv", rinvo.getTv());
		hm.put("refri", rinvo.getRefri());
		hm.put("bath", rinvo.getBath());
		hm.put("iron", rinvo.getIron());
		hm.put("minibar", rinvo.getMinibar());
		hm.put("bathitem", rinvo.getBathitem());
		hm.put("aircon", rinvo.getAircon());
		hm.put("shower", rinvo.getShower());
		hm.put("dryer", rinvo.getDryer());
		hm.put("ricecooker", rinvo.getRicecooker());
		hm.put("fitness", linvo.getFitness());
		hm.put("sauna", linvo.getSauna());
		hm.put("restaurant", linvo.getRestaurant());
		hm.put("lounge", linvo.getLounge());
		hm.put("bbq", linvo.getBbq());
		hm.put("publicspa", linvo.getPublicspa());
		hm.put("seminar", linvo.getSeminar());
		hm.put("singing", linvo.getSinging());
		hm.put("washingmachine", linvo.getWashingmachine());
		hm.put("dehydrator", linvo.getDehydrator());
		hm.put("cooking", linvo.getCooking());
		hm.put("spa", linvo.getSpa());
		hm.put("pool", linvo.getPool());
		hm.put("golf", linvo.getGolf());
		hm.put("elevator", linvo.getElevator());
		hm.put("pc", linvo.getPc());
		hm.put("cafe", linvo.getCafe());
		hm.put("footvolleyball", linvo.getFootvolleyball());
		hm.put("store", linvo.getStore());
		hm.put("dining", linvo.getDining());
		hm.put("dryer", linvo.getDryer());
		hm.put("parking", linvo.getParking());
		hm.put("publicshower", linvo.getPublicshower());
		hm.put("ski", linvo.getSki());
		hm.put("pickup", linvo.getPickup());
		hm.put("printer", linvo.getPrinter());
		hm.put("locker", linvo.getLocker());
		hm.put("breakfast", linvo.getBreakfast());
		hm.put("valetparking", linvo.getValetparking());
		hm.put("dog", linvo.getDog());
		hm.put("inroomcooking", linvo.getInroomcooking());
		hm.put("keepluggage", linvo.getKeepluggage());
		hm.put("freeparking", linvo.getFreeparking());
		hm.put("inroomsmoking", linvo.getInroomsmoking());
		hm.put("nosmoking", linvo.getNosmoking());
		hm.put("creditcard", linvo.getCreditcard());
		hm.put("fromDate", fromDate);
		hm.put("toDate", toDate);
		hm.put("men", men);
		
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectLodgingList",hm);
	}
	
	public Map<String,Object> selectLodging(int lidx) {
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.selectLodging",lidx);
	}
	
	public List<RoominVO> selectRoomList(int lidx, String men){
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lidx",lidx);
		hm.put("men", men);		
		
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectRoomList", hm);
	}
	
	public RoomVO selectRoom(int ridx) {
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.selectRoom", ridx);
	}
	
	public List<ReviewVO> selectReview(HashMap hm) {
		return sqlSession.selectList("team.projectA.mapper.lodgingMapper.selectReview", hm);
	}
	
	public int RVCount(int lidx) {
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.RVCount", lidx);
	}
	
	public ReviewVO selectLodgingRV(int lidx) {
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.selectLodgingRV", lidx);
	}
	
	public List<Map<String,Object>> listSearch(HashMap hm)throws Exception{
		
		List<Map<String,Object>> alist = sqlSession.selectList("team.projectA.mapper.lodgingMapper.listSearch",hm);
		return alist;
	}
	public int countSearch(SearchCriteria scri)throws Exception{
		return sqlSession.selectOne("team.projectA.mapper.lodgingMapper.countSearch",scri);
	}
	
	
}