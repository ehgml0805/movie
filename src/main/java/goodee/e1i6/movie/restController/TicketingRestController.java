package goodee.e1i6.movie.restController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.ScreeningScheduleService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Theater;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TicketingRestController {
	@Autowired TheaterService theaterService;
	@Autowired MovieService movieService;
	@Autowired ScreeningScheduleService screeningScheduleService;
	
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
	@GetMapping("/ticketing/theaterList")
	public List<Theater> getTheaterNameListByRegion(@RequestParam String theaterRegion) {
		log.debug(TeamColor.CHOI + "GET TheaterNameListByRegion");
		return theaterService.geTheaterNameListByRegion(theaterRegion);
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
		return theaterService.getRegionListByMovie(movieKey, startDate);
	}
	
	@GetMapping("/ticketing/screeningScheduleListByDate")
	public ArrayList<Map<String, Object>> getScreeningScheduleListByDate(@RequestParam(value = "movieKey", defaultValue = "0") int movieKey
																, @RequestParam(value = "theaterKey", defaultValue = "0") int theaterKey
																, @RequestParam(value = "date", defaultValue = "") String date){
		log.debug(TeamColor.JYW + "GET ScreeningScheduleList");
		return screeningScheduleService.getScreeningScheduleListByDate(movieKey, theaterKey, date);
	}
}

