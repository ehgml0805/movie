package goodee.e1i6.movie.scheduler;

import org.springframework.scheduling.annotation.Scheduled;

public class CoupunScheduler {
	/** * 1. 오후 05:50:00에 호출이 되는 스케쥴러 */ 
	@Scheduled(cron = "0 31 16 * * *") //조, 분 , 일 , 시, 월, 요일
	public void cronTest1(){ System.out.println("오후 05:50:00에 호출이 됩니다 "); } 
	
	/** * 2. 오후 05:51:00에 호출이 되는 스케쥴러 */ @Scheduled(cron = "0 19 16 * * *") 
	public void cronTest2(){ System.out.println("오후 05:51:00에 호출이 됩니다 "); }
}
