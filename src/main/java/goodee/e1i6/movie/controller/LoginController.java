package goodee.e1i6.movie.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import goodee.e1i6.movie.service.IdService;
import goodee.e1i6.movie.service.LoginService;
import goodee.e1i6.movie.vo.Customer;


@Controller
public class LoginController {
	@Autowired LoginService loginService;
	@Autowired IdService idService;

	
	// 카카오 로그인
	@GetMapping("/kakao/callback") 
	public @ResponseBody String kakaoCallback(String code) { //ResponseBody : Data를 리턴해주는 컨트롤러 함수
		
		//POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		//Retrofit2
		//OkHttp
		//RestTemplate
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "45fa960795332ab0baa93dabe554c8a5");
		params.add("redirect_uri", "http://localhost/movie/kakao/callback");
		params.add("code", code); //code는 동적이다
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params, headers);
		ResponseEntity response = rt.exchange(
				"https://kauth.kakao.com/oauth/token"
				, HttpMethod.POST
				, kakaoTokenRequest
				, String.class
				);		
		
		
		return "카카오인증 완료 코드 :"+code;
	}
	
	
	// customer 로그인
	@GetMapping("/login/loginCustomer")
	public String loginCustomer() {
		
		return "login/loginCustomer";
	}
	
	@PostMapping("/login/loginCustomer")
	public String loginCustomer (HttpSession session, Customer customer) {
		Customer resultCustomer = loginService.login(customer);
		session.setAttribute("loginCustomer", resultCustomer);
		return "redirect:/homeEx";
	}
	
	
	// customer 로그아웃
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/homeEx";
	}
	
	
	// customer 회원가입
	@GetMapping("/login/addCustomer")
	public String addCustomer() {
		
		return "login/addCustomer";
	}
	@PostMapping("/login/addCustomer")
	public String addCustomer(Model model, Customer customer) {
		
		String id = idService.getIdCheck(customer.getCustomerId());
		if(id != null) { // 입력한 ID가 기존 DB에 존재 시, 다시 회원가입 페이지로 이동
			model.addAttribute("errorMsg", "중복된 ID입니다");
			return "login/addCustomer";
		}
		
		int row = loginService.addCustomer(customer);
		if(row != 1) { // row != 1이면 입력실패
			model.addAttribute("errorMsg", "가입 실패");
			return "customer/addCustoemr";
			
		}
		return "redirect:/login/loginCustomer";
		
		
	}
	

	
	
	
	
}
