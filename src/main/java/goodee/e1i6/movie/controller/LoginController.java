package goodee.e1i6.movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.IdService;
import goodee.e1i6.movie.service.LoginService;
import goodee.e1i6.movie.vo.Customer;


@Controller
public class LoginController {
	@Autowired LoginService loginService;
	@Autowired IdService idService;
	
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
