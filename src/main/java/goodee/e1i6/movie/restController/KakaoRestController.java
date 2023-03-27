package goodee.e1i6.movie.restController;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import goodee.e1i6.movie.service.KaKaoService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
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
    public KakaopayReady readyToKakaoPay(Model model, HttpSession session
											, @RequestParam(value = "scheduleKey", required = true) int scheduleKey
											, @RequestParam(value = "mycouponKey", required = true) int mycouponKey
											, @RequestParam(value = "totalPrice", required = true) int totalPrice
											, @RequestParam(value = "discountPrice", required = true) int discountPrice
											, @RequestParam(value = "kakaoPrice", required = true) int kakaoPrice
											, @RequestParam(value = "seatKey", required = true) String[] seatKey
											, @RequestParam(value = "movieTitle", required = true) String movieTitle) {
    	log.debug(TeamColor.JYW + "GET kakaoPay");
    	
    	Customer customer = (Customer)session.getAttribute("loginCustomer");
    	Ticketing ticketing = new Ticketing();
    	ticketing.setScheduleKey(scheduleKey);
    	ticketing.setMycouponKey(mycouponKey);
    	ticketing.setCustomerId(customer.getCustomerId());
    	ticketing.setTotalPrice(totalPrice);
    	ticketing.setDiscountPrice(discountPrice);
    	
    	// ticketing정보를 모델에 저장
    	model.addAttribute("ticketing",ticketing);
    	log.debug(TeamColor.JYW + "ticketing :" + ticketing);
    	
    	// seatKey정보를 모델에 저장
    	model.addAttribute("seatKey",seatKey);
    	log.debug(TeamColor.JYW + "seatKey : " + seatKey);
    	
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("customerId", customer.getCustomerId());
    	log.debug(TeamColor.JYW + "customer.getCustomerId() : " + customer.getCustomerId());
    	paramMap.put("movieTitle", movieTitle);
    	log.debug(TeamColor.JYW + "movieTitle : " + movieTitle);
    	paramMap.put("quantity", seatKey.length);
    	log.debug(TeamColor.JYW + "seatKey.length : " + seatKey.length);
    	paramMap.put("kakaoPrice", kakaoPrice);
    	log.debug(TeamColor.JYW + "kakaoPrice : " + kakaoPrice);
    	
    	
        return kaKaoService.kakaopayReady(paramMap);
    }
}
