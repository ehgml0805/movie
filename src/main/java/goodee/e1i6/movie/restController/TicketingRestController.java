package goodee.e1i6.movie.restController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.ScreeningScheduleService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Theater;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TicketingRestController {
	@Autowired TheaterService theaterService;
	@Autowired MovieService movieService;
	@Autowired ScreeningScheduleService screeningScheduleService;
	@Autowired CouponService couponService;
	
	// 빠른 예매 - 상영 스케줄 키 값 받아오기
	@GetMapping("/ticketing/screeningScheduleOneByTicketing")
	public Map<String, Object> getScreeningScheduleOneByTicketing(@RequestParam(value = "movieKey", defaultValue = "0") int movieKey
																	, @RequestParam(value = "time", defaultValue = "") String time){
		log.debug(TeamColor.JYW + "GET ScreeningScheduleOneByTicketing");
		
		return screeningScheduleService.getScreeningScheduleOneByTicketing(movieKey, time);
	}
	
	//  빠른 예매 - 날짜에 따른 영화 전체 목록
	@GetMapping("/ticketing/movieListByDate")
	public List<Map<String, Object>> getMovieListByDate(@RequestParam(value = "startDate", defaultValue = "") String startDate
																, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey) {
		log.debug(TeamColor.CHOI + "GET MovieListByDate");
//		
//		List<Map<String, Object>> movieListByDate = movieService.getMovieListByDate(startDate);
//		List<Map<String, Object>> regionListByDate = theaterService.getRegionListByMovie(movieKey);
//		
//		ArrayList<List<Map<String, Object>>> movieInfoListByDate = new ArrayList<>();
//		movieInfoListByDate.add(movieListByDate);
//		movieInfoListByDate.add(regionListByDate);
//		
		return movieService.getMovieListByDate(startDate);
	}
	
	// 빠른 예매 - 극장 선택 시 극장 키 값
	@GetMapping("/ticketing/theaterOneByName")
	public int getTheaterOneByName(@RequestParam(value = "theaterName", defaultValue = "") String theaterName) {
		log.debug(TeamColor.JYW + "GET theaterOneByName");
		
		return theaterService.getTheaterOneByName(theaterName);
	}
	
	// 빠른 예매 - 극장 리스트
	@GetMapping("/ticketing/theaterNameListByRegion")
	public List<Theater> getTheaterNameListByRegion(@RequestParam String theaterRegion, @RequestParam String startDate, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey) {
		log.debug(TeamColor.CHOI + "GET TheaterNameListByRegion");
		return theaterService.geTheaterNameListByRegion(theaterRegion, startDate, movieKey);
	}
	
	// 빠른 예매 - 영화 상세 정보(이미지 출력용)
	@GetMapping("/ticketing/movieOne")
	public List<Map<String, Object>> getMovieOne(@RequestParam int movieKey){
		log.debug(TeamColor.JYW + "GET getMovieOne");
		return movieService.getMovieOne(movieKey);
	}
	
	// 빠른 예매 - 영화 선택 시 해당 지역 및 상영중인 극장 수 출력
	@GetMapping("/ticketing/regionList")
	public List<Map<String, Object>> getRegionListByMovie(@RequestParam(value = "movieKey", defaultValue = "0") int movieKey
															, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		log.debug(TeamColor.CHOI + "GET RegionListByMovie");
		log.debug(TeamColor.CHOI + movieKey);
		return theaterService.getRegionListByMovie(movieKey, startDate);
	}
	
	/*
	// 빠른 예매 - 지역별 극장 수 카운트 단, 스케쥴키가 있는 영화만 카운트
	@GetMapping("/ticketing/regionListBySchedule")
	public List<Map<String, Object>> getRegionListBySchedule(@RequestParam(value = "movieKey", defaultValue = "0") int movieKey
			, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		log.debug(TeamColor.CHOI + "GET RegionListBySchedule");
		return theaterService.getRegionListBySchedule(movieKey, startDate);
	}
	*/
	
	@GetMapping("/ticketing/screeningScheduleListByDate")
	public ArrayList<Map<String, Object>> getScreeningScheduleListByDate(@RequestParam(value = "movieKey", defaultValue = "0") int movieKey
																, @RequestParam(value = "theaterKey", defaultValue = "0") int theaterKey
																, @RequestParam(value = "date", defaultValue = "") String date){
		log.debug(TeamColor.JYW + "GET ScreeningScheduleList");
		return screeningScheduleService.getScreeningScheduleListByDate(movieKey, theaterKey, date);
	}
	
	// 결제하기 - 다시하기버튼
	@GetMapping("/customer/ticketing/mycouponeList")
	public List<Map<String, Object>> getMycouponeList(HttpSession session, Model model) {
		// 사용가능한 쿠폰 불러오기
		Customer customer = (Customer)session.getAttribute("loginCustomer");
		
		return couponService.selectMyCouponList(session, customer.getCustomerId());
	}
}

