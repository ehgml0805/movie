package goodee.e1i6.movie.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import goodee.e1i6.movie.mapper.CouponMapper;

@Component
public class CoupunScheduler {
	@Autowired CouponMapper couponMapper;
	//fixedRate는 작업의 시작부터 시간을 카운트
	//fixedDelay는 작업이 끝난 시점부터 시간을 카운트
	//cron은 초, 분, 시, 일, 월, 주, (년) 을 지정해 스케줄러를 동작 이 때, (년) 은 생략 가능합니다.
	//0,7은 일요일, 1:월~6:토
	/*
	 * @Scheduled(cron = "0 0/1 13 * * *") //초, 분, 일, 시, 월, 요일, 년 public void
	 * cronTest1(){
	 * 
	 * System.out.println("호출이 됩니다 ");
	 * 
	 * }
	 */
	//매월 1일에 자동 실행
	@Scheduled(cron = "0 0 0 1 * *")
	public void mic() {
		
		couponMapper.mic();
		System.out.println("매월 정기 쿠폰이 등록되었습니다.");
	}
}
