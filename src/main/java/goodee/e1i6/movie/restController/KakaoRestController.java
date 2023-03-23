package goodee.e1i6.movie.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.KaKaoService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.KakaopayReady;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class KakaoRestController {
	@Autowired KaKaoService kaKaoService;
	
	/**
     * 결제요청
     */
    @GetMapping("/kakaopay")
    public KakaopayReady readyToKakaoPay() {
    	log.debug(TeamColor.CHOI + "GET kakaoPay");
    	
        return kaKaoService.kakaopayReady(null);
    }
}
