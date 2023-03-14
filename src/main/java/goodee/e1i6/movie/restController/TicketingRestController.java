package goodee.e1i6.movie.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Theater;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TicketingRestController {
	@Autowired TheaterService theaterService;
	
	@GetMapping("/ticketing/theaterList")
	public List<Theater> getTheaterNameListByRegion(@RequestParam String theaterRegion) {
		log.debug(TeamColor.CHOI + "GET TheaterNameListByRegion");
		return theaterService.geTheaterNameListByRegion(theaterRegion);
	}
}
