package goodee.e1i6.movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.ScreeningScheduleService;
import goodee.e1i6.movie.service.ScreenroomService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.ScreeningSchedule;
import goodee.e1i6.movie.vo.Theater;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScreeningScheduleController {
	@Autowired ScreeningScheduleService screeningScheduleService;
	@Autowired MovieService movieService;
	@Autowired ScreenroomService screenroomService;
	@Autowired TheaterService theaterService;
	
	// 상영 스케줄 삭제
	@GetMapping("/employee/screeningSchedule/removeScreeningSchedule")
	public String removeScreeningSchedule(@RequestParam(value="scheduleKey", required = true) int scheduleKey) {
		screeningScheduleService.removeScreeningSchedule(scheduleKey);
		return "redirect:/employee/screeningSchedule/screeningScheduleList";
	}
	
	// 상영 스케줄 수정
	@GetMapping("/employee/screeningSchedule/modifyScreeningSchedule")
	public String modifyScreeningSchedule(Model model
										, @RequestParam(value="scheduleKey", required = true) int scheduleKey) {
		Map<String, Object> screeningSchedule = screeningScheduleService.getScreeningScheduleOne(scheduleKey);
		model.addAttribute("screeningSchedule", screeningSchedule);
		return "/employee/screeningSchedule/modifyScreeningSchedule";
	}
	@PostMapping("/employee/screeningSchedule/modifyScreeningSchedule")
	public String modifyScreeningSchedule(Model model, ScreeningSchedule screeningSchedule) {
		int scheduleKey = screeningSchedule.getScheduleKey();
		int row = screeningScheduleService.modifyScreeningSchedule(screeningSchedule);
		
		// row != 0 이면 입력성공
		if(row == 0) {
			model.addAttribute("msg", "수정실패하였습니다.");
			return "/employee/screeningSchedule/modifyScreeningSchedule?scheduleKey="+scheduleKey;
		}
		
		return "redirect:/employee/screeningSchedule/screeningScheduleList";
	}
	
	// 상영 스케줄 입력
	@GetMapping("/employee/screeningSchedule/addScreeningSchedule")
	public String addScreeningScheduleList(Model model, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		ArrayList<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		model.addAttribute("movieList", movieList);
		
		List<Theater> theaterList = theaterService.getTheaterList();
		model.addAttribute("theaterList", theaterList);
		
		return "/employee/screeningSchedule/addScreeningSchedule";
	}
	@PostMapping("/employee/screeningSchedule/addScreeningSchedule")
	public String addScreeningScheduleList(Model model, ScreeningSchedule screeningSchedule) {
		int row = screeningScheduleService.addScreeningSchedule(screeningSchedule);
		
		// row != 0 이면 입력성공
		if(row == 0) {
			model.addAttribute("msg", "등록실패하였습니다.");
			return "/employee/screeningSchedule/addScreeningSchedule";
		}
		
		return "redirect:/employee/screeningSchedule/screeningScheduleList";
	}
	
	// 상영 스케줄 한 개
	@GetMapping("/employee/screeningSchedule/screeningScheduleOne")
	public String getScreeningScheduleOne(Model model
										, @RequestParam(value="scheduleKey", required = true) int scheduleKey) {
		log.debug(TeamColor.JYW + "GET screeningScheduleOne");
		
		Map<String, Object> screeningSchedule = screeningScheduleService.getScreeningScheduleOne(scheduleKey);
		model.addAttribute("screeningSchedule", screeningSchedule);
		
		return "/employee/screeningSchedule/screeningScheduleOne";
	}
	
	// 상영 스케줄 목록
	@GetMapping("/employee/screeningSchedule/screeningScheduleList")
	public String getScreeningScheduleList(Model model
										, @RequestParam(value="movieKey", defaultValue = "0", required = false) int movieKey
										, @RequestParam(value="theaterKey", defaultValue = "0", required = false) int theaterKey
										, @RequestParam(value="date", defaultValue = "", required = false) String date) {
		log.debug(TeamColor.JYW + "GET screeningScheduleList");
		
		ArrayList<Map<String, Object>> screeningScheduleList = screeningScheduleService.getScreeningScheduleList(movieKey, theaterKey, date);
		model.addAttribute("screeningScheduleList", screeningScheduleList);
		
		return "/employee/screeningSchedule/screeningScheduleList";
	}
}
