package goodee.e1i6.movie.restController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import goodee.e1i6.movie.service.KaKaoService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.KakaopayReady;
import goodee.e1i6.movie.vo.Ticketing;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
//세션에 저장된 겂을 사용할때 쓰는 어노테이션, session에서 없으면 model까지 훑어서 찾아냄.
@SessionAttributes({"tid","ticketing"})
public class KakaoRestController {
	@Autowired KaKaoService kaKaoService;
	
	// 카카오페이 결제 요청
    @GetMapping("/kakaopay")
    public KakaopayReady readyToKakaoPay(Model model
											, @RequestParam(value = "scheduleKey", required = true) int scheduleKey
											, @RequestParam(value = "mycouponKey", required = true) int mycouponKey
											, @RequestParam(value = "customerId", required = true) String customerId
											, @RequestParam(value = "totalPrice", required = true) int totalPrice
											, @RequestParam(value = "discountPrice", required = true) int discountPrice
											, @RequestParam(value = "kakaoPrice", required = true) int kakaoPrice
											, @RequestParam(value = "seatKey", required = true) int[] seatKey
											, @RequestParam(value = "movieTitle", required = true) String movieTitle) {
    	log.debug(TeamColor.JYW + "GET kakaoPay");
    	
    	Ticketing ticketing = new Ticketing();
    	ticketing.setScheduleKey(scheduleKey);
    	ticketing.setMycouponKey(mycouponKey);
    	ticketing.setCustomerId(customerId);
    	ticketing.setTotalPrice(totalPrice);
    	ticketing.setDiscountPrice(discountPrice);
    	
    	// ticketing정보를 모델에 저장
    	model.addAttribute("ticketing",ticketing);
    	log.debug(TeamColor.JYW + "ticketing");
    	
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("customerId", customerId);
    	paramMap.put("movieTitle", movieTitle);
    	paramMap.put("quantity", seatKey.length);
    	paramMap.put("kakaoPrice", kakaoPrice);
    	paramMap.put("movieTitle", movieTitle);
    	
    	
        return kaKaoService.kakaopayReady(paramMap);
    }
}
