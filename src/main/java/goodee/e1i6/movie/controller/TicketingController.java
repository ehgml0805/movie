package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.ScreeningScheduleService;
import goodee.e1i6.movie.service.SeatService;
import goodee.e1i6.movie.service.StillCutService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.vo.Seat;
import goodee.e1i6.movie.vo.StillCut;

@Controller
public class TicketingController {
	@Autowired MovieService movieService;
	@Autowired TheaterService theaterService;
	@Autowired ScreeningScheduleService screeningScheduleService;
	@Autowired StillCutService stillCutService;
	@Autowired SeatService seatService;
	
	@GetMapping("/ticketing/screenList")
	public String getScreenList(Model model
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey
									, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		List<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		List<Map<String, Object>> theaterRegionList = theaterService.getTheaterRegionList();
		
		model.addAttribute("theaterRegionList", theaterRegionList);
		model.addAttribute("movieList", movieList);	
		
		model.addAttribute("movieKey", movieKey);
		
		return "/customer/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/screenList2")
	public String getScreenList2(Model model
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey
									, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		List<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		List<Map<String, Object>> theaterRegionList = theaterService.getTheaterRegionList();
		
		model.addAttribute("theaterRegionList", theaterRegionList);
		model.addAttribute("movieList", movieList);
		
		model.addAttribute("movieKey", movieKey);
		
		return "/customer/ticketing/screenList2";
	}
	
	@GetMapping("/ticketing/ticketingSeat")
	public String ticketingSeat(Model model
									, @RequestParam(value = "scheduleKey", defaultValue = "0") int scheduleKey
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey) {
		
		Map<String, Object> scheduleOne = screeningScheduleService.getScreeningScheduleOne(scheduleKey);
		model.addAttribute("scheduleOne", scheduleOne);	
		
		int screenroomKey = (int)scheduleOne.get("screenroomKey");
		List<Seat> seatList = seatService.getSeatListByScreenroom(screenroomKey);
		model.addAttribute("seatList", seatList);	
		
		StillCut stillCut = stillCutService.getStillCutOneByTicketing(movieKey);
		model.addAttribute("stillCut", stillCut);	
		
		return "/customer/ticketing/ticketingSeat";
	}
}
