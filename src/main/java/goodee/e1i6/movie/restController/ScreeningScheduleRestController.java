package goodee.e1i6.movie.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.ScreenroomService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Screenroom;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ScreeningScheduleRestController {
	@Autowired ScreenroomService screenroomService;
	
	@GetMapping("/screenroom/screenroomList")
	public List<Screenroom> getScreenroomList(@RequestParam(value = "theaterKey") int theaterKey) {
		log.debug(TeamColor.JYW + "GET ScreenroomList");
		return screenroomService.getScreenroomList(theaterKey);
	}
}
