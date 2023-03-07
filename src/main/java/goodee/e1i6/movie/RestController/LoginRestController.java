package goodee.e1i6.movie.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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

}
