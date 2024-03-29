package goodee.e1i6.movie.controller;



import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import goodee.e1i6.movie.service.IdService;
import goodee.e1i6.movie.service.LoginService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.CustomerForm;
import goodee.e1i6.movie.vo.Employee;
import goodee.e1i6.movie.vo.KakaoProfile;
import goodee.e1i6.movie.vo.OAuthToken;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	@Autowired LoginService loginService;
	@Autowired IdService idService;

	
	// 카카오 로그인
	
	@GetMapping("/kakao/callback") 
	public String kakaoCallback(String code, Customer customer, HttpSession session) { //ResponseBody : Data를 리턴해주는 컨트롤러 함수
		
		//POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		//Retrofit2
		//OkHttp
		//RestTemplate
		 
		
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "ade6ceae84db1bedc786e318204f8ca8");
		params.add("redirect_uri", "http://localhost/movie/kakao/callback");
		params.add("code", code); //code는 동적이다
	
		// HttpHeader와 HttpBody를 하나의 오브젝트로 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params, headers);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token"
				, HttpMethod.POST
				, kakaoTokenRequest
				, String.class
			);		
		
		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token());
		
		RestTemplate rt2 = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	
		// HttpHeader와 HttpBody를 하나의 오브젝트로 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
				new HttpEntity<>(headers2);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답받음
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me"
				, HttpMethod.POST
				, kakaoProfileRequest2
				, String.class
			);	
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		//User 오브젝트 : username, password, email
		System.out.println("카카오 아이디(번호) :"+kakaoProfile.getId());
		System.out.println("카카오 이메일 :"+kakaoProfile.getKakao_account().getEmail());
		
		// 유저아이디 중복 안되게
		System.out.println("페이지 유저아이디 :"+kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId());
		System.out.println("페이지 이메일 :"+kakaoProfile.getKakao_account().getEmail());
		
		// UUID 랜덤 패스워드
		UUID garbagePassword =  UUID.randomUUID();
		System.out.println("페이지 패스워드 :"+garbagePassword);
		
		//Customer KakaoCustomer = Customer.builder()
		//	.customerId(kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId())
		//	.customerPw(garbagePassword.toString())
		//	.customerEmail(kakaoProfile.getKakao_account().getEmail())
		//	.oauth("kakao")
		//	.build();
		
		
		Customer kakaoCustomer = new Customer();
		kakaoCustomer.setCustomerId(kakaoProfile.getKakao_account().getEmail());
		kakaoCustomer.setCustomerPw(garbagePassword.toString());
		kakaoCustomer.setCustomerEmail(kakaoProfile.getKakao_account().getEmail());
		kakaoCustomer.setOauth("kakao");
		kakaoCustomer.setCustomerName(kakaoProfile.getProperties().getNickname());
		
		System.out.println(kakaoCustomer);
		
		Customer OriginCustomer = loginService.findCustomer(kakaoCustomer.getCustomerId());
		
		if(OriginCustomer == null) {
			loginService.addCustomer(kakaoCustomer);
			return "/login/modifyCustomer";
			
		} else {
			
			//Customer kakaoOne=loginService.kakaoLogin(customer);
			//log.debug(TeamColor.KSH +kakaoOne + "<==카카오 로그인 값");
			Customer resultCustomer = loginService.kakaoLogin(OriginCustomer);
			session.setAttribute("loginCustomer", resultCustomer);
			
		
		}
		return "redirect:/home";
		
		
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
		return "redirect:/home";
	}
	
	
	// customer 로그아웃
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	// 관리자 로그인
	@GetMapping("/login/loginEmployee")
	public String loginEmployee() {
		
		return "login/loginEmployee";
	}
	
	@PostMapping("/login/loginEmployee")
	public String loginEmployee (HttpSession session, Employee employee) {
		Employee resultEmployee = loginService.loginEmployee(employee);
		session.setAttribute("loginEmployee", resultEmployee);
		return "redirect:/home";
	}
	
	
	// customer 로그아웃
	@GetMapping("/login/logoutEmployee")
	public String logoutEmployee(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	
	// customer 회원가입
	@GetMapping("/login/addCustomer")
	public String addCustomer() {
		
		return "login/addCustomer";
	}
	@PostMapping("/login/addCustomer")
	public String addCustomer(Model model, HttpServletRequest request, CustomerForm customerForm) {
		String path = request.getServletContext().getRealPath("/customer-upload/");
		log.debug(TeamColor.JSM + path + " <- addCustomer path");
		log.debug(TeamColor.JSM + customerForm + " <- customerForm :");
		
		List<MultipartFile> customerImgList = customerForm.getCustomerImgList();
		if(customerImgList.get(0).getSize() > 0) {// 하나 이상의 파일이 업로드 될 경우
			for(MultipartFile mf : customerImgList) {
				log.debug(TeamColor.JSM + mf.getOriginalFilename() + " <- addCustomer fileName");
			}
		}
			
		String id = idService.getIdCheck(customerForm.getCustomerId());
		if(id != null) { // 입력한 ID가 기존 DB에 존재 시, 다시 회원가입 페이지로 이동
			model.addAttribute("errorMsg", "중복된 ID입니다");
			return "login/addCustomer";
		}
		
		loginService.addCustomer(customerForm, path);
		
		return "redirect:/home";
		
	}
	

	// 한명의 회원정보 불러오기
	@GetMapping("/login/modifyCustomer")
	public String selectCustomerOne(Customer customer) {
		return "/login/modifyCustomer";
	}
	
	// 회원정보 수정
	@PostMapping("/login/modifyCustomer")
	public String modifyCustomer(HttpSession session, Customer customer) {
			
		Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
		
		loginService.updateCustomer(customer);
		
		return "redirect:/home";
	
	}
	
	
	
	
	
	
	
	
}
