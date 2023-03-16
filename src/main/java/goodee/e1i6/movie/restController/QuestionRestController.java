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
public class QuestionRestController {
	@Autowired TheaterService theaterService;
	
	// 지역선택 후 극장 리스트 받기
	@GetMapping("/question/theaterList")
	public List<Theater> getTheaterListByRegion(@RequestParam(value="theaterRegion") String theaterRegion) {
		log.debug(TeamColor.YIB + "get 극장 리스트");
		return theaterService.geTheaterNameListByRegion(theaterRegion);

	}
}
