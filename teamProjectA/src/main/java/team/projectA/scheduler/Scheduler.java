package team.projectA.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
					//초 분 시 일 월 요일 연도(생략가능) 
	
	@Scheduled(cron="0 53 12 * * *")
	public void autoUpdate() {
		System.out.println("스케줄러 작동완료 !");
	}
}
