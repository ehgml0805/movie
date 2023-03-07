package goodee.e1i6.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import goodee.e1i6.movie.teamColor.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TheaterController {
	
	@GetMapping("/emp/theater/theaterList")
	public String getTheaterList() {
		log.debug(TeamColor.CHOI + "GET theaterList");
		
		return "/theater/theaterList";
	}
}
