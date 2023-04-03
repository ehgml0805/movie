package goodee.e1i6.movie.restController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.LoginService;

@RestController
public class LoginRestController {
	@Autowired LoginService loginService;
	
	@GetMapping("/idck")
	public String idck(@RequestParam(value ="customerId") String customerId) {
		return loginService.getCustomerId(customerId);
	}
	
	@PostMapping("/loginCheck")
	public String loginCheck(HttpSession session) {
		String loginCheck = "";
		if(session.getAttribute("loginCustomer") != null) {
			loginCheck = "customer";
		}
		if(session.getAttribute("loginEmployee") != null) {
			loginCheck = "employee";
		}
		return loginCheck;
	}
	
}
