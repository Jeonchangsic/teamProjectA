package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.ReservVO;
import team.projectA.vo.RoomVO;
@Repository
public class ReservDAO {
	@Autowired
	private SqlSession sqlsession;
	
public int reservInsert(HashMap hm)throws Exception{
		
		int alist = sqlsession.insert("team.projectA.mapper.ReservMapper.reservInsert",hm);
		return alist;
	}
}
