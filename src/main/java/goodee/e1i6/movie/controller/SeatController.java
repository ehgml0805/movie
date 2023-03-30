package goodee.e1i6.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.SeatService;
import goodee.e1i6.movie.teamColor.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SeatController {
	@Autowired SeatService seatService;
	
	// 좌석 추가
	@GetMapping("/employee/seat/addSeat")
	public String addSeat() {
		log.debug(TeamColor.CHOI + "GET addSeat");
		return "/employee/seat/addSeat";
	}
	
	@PostMapping("/employee/seat/addSeat")
	public String addSeat(@RequestParam(value = "screenroomKey", defaultValue = "0") int screenroomKey
							, @RequestParam(value = "x", defaultValue = "0") int x
							, @RequestParam(value = "y", defaultValue = "0") int y) {
		log.debug(TeamColor.CHOI + "POST addSeat");
		log.debug(TeamColor.CHOI + screenroomKey + x + y);
		seatService.addSeat(screenroomKey, x, y);
		return "redirect:/employee/screenroom/screenroomOne?screenroomKey=" + screenroomKey;
	}
}
