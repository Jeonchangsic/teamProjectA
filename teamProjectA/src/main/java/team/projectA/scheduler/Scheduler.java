package team.projectA.scheduler;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import team.projectA.service.IndexService;
import team.projectA.vo.ReservVO;

@Component
public class Scheduler {
					 
	@Autowired
	private IndexService indexService;
					
	
					//초 분 시 일 월 요일 연도(연도는 생략가능)
	@Scheduled(cron="0 10 11 * * *")
	public void autoUpdate(){
		List<ReservVO> list = indexService.roomCount(); //ridx count 값이 들어있는 리스트.
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		
		for(int i = 0; i<list.size(); i++) {
			/* System.out.println("스케줄러 for문 작동!"); */
			
			int ridx = list.get(i).getRidx();
			int cnt =  list.get(i).getCnt();			
			hm.put("ridx", ridx);
			hm.put("cnt", cnt);
			
			
			 /* System.out.println("스케줄러 ridx="+ridx);
			 *  System.out.println("스케줄러 cnt="+cnt);
			 */
			indexService.roomPlus2(ridx);
			indexService.roomPlus(hm); //업데이트.
		}
		
		System.out.println("스케줄러 작동 완료!");
	}
}
