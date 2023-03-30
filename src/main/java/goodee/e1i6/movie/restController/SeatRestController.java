package goodee.e1i6.movie.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.SeatService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.SeatRest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SeatRestController {
	@Autowired SeatService seatService;
	
	// 좌석 수정
	@PostMapping("/employee/seat/modifySeat")
	public int modifySeat(@RequestBody SeatRest seatRest) {
		log.debug(TeamColor.CHOI + "REST modifySeat");			
		log.debug(TeamColor.CHOI + seatRest);			
		
		return seatService.modifySeat(seatRest);
	}
}
