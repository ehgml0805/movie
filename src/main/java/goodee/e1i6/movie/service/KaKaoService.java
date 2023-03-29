package goodee.e1i6.movie.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.KakaopayApprove;
import goodee.e1i6.movie.vo.KakaopayReady;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class KaKaoService {
	
	private KakaopayReady kakaopayReady;
	private KakaopayApprove kakaopayApprove;
	
	// 단건 결제 - 결제 준비하기
	public KakaopayReady kakaopayReady(Map<String, Object> paramMap) {
		
		// 카카오페이 요청 양식
        MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<>();
       /* 
        parameters.add("cid", cid); // 가맹점 코드, 10자
        parameters.add("partner_order_id", paramMap.get("partnerOrderId"));
        parameters.add("partner_user_id", paramMap.get("customerId"));
        parameters.add("item_name", paramMap.get("movieTitle"));
        parameters.add("quantity", paramMap.get("quantity"));
        parameters.add("total_amount", paramMap.get("kakaoPrice"));
        parameters.add("vat_amount", paramMap.get("vatAmount"));
        parameters.add("tax_free_amount", paramMap.get("taxFreeAmount"));
        parameters.add("approval_url", "http://localhost/movie/movie/movieList"); // 성공 시 redirect url
        parameters.add("cancel_url", "http://localhost/movie/movie/movieList"); // 취소 시 redirect url
        parameters.add("fail_url", "http://localhost/movie/movie/movieList"); // 실패 시 redirect url
        */
        parameters.add("cid", "TC0ONETIME"); // 가맹점 코드, 테스트 코드
        parameters.add("partner_order_id", "KA12345678");
        parameters.add("partner_user_id", (String)paramMap.get("customerId"));
        parameters.add("item_name", (String)paramMap.get("movieTitle"));
        parameters.add("quantity", (Integer)paramMap.get("quantity"));
        parameters.add("total_amount", (Integer)paramMap.get("kakaoPrice"));
        parameters.add("tax_free_amount", "0");
        parameters.add("approval_url", "http://localhost/movie/ticketing/kakaopaySuccess"); // 성공 시 redirect url
        parameters.add("cancel_url", "http://localhost/movie/ticketing/screenList"); // 취소 시 redirect url
        parameters.add("fail_url", "http://localhost/movie/ticketing/screenList"); // 실패 시 redirect url
        
        // 파라미터, 헤더
		HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
        
        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();
    	this.kakaopayReady = restTemplate.postForObject("https://kapi.kakao.com/v1/payment/ready", requestEntity, KakaopayReady.class);
        
    	log.debug(TeamColor.JYW + "GET kakaopayReady");
    	
        return kakaopayReady;
	}
	
	// 단건 결제 - 결제 승인하기
	public KakaopayApprove KakaopayApprove(String pg_token, HttpSession session) {
		
		log.debug(TeamColor.JYW + "GET KakaopayApprove");
		
		// 카카오페이 요청 양식
        MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<>();
		
        Customer customer = (Customer)session.getAttribute("loginCustomer");
        String customerId = customer.getCustomerId();
        
        parameters.add("cid", "TC0ONETIME"); // 가맹점 코드, 테스트 코드
        parameters.add("tid", this.kakaopayReady.getTid());        
        parameters.add("partner_order_id", "KA12345678");
        parameters.add("partner_user_id", customerId);
        parameters.add("pg_token", pg_token);
        
        // 파라미터, 헤더
		HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(parameters, this.getHeaders());
        
        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();
        this.kakaopayApprove = restTemplate.postForObject("https://kapi.kakao.com/v1/payment/approve", request, KakaopayApprove.class);
    	
        return kakaopayApprove;
	}
	
	// header() 셋팅
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 93fe440416fe07aecb251da20e355baf");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
}
