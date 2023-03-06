package goodee.e1i6.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/homeEx")
	public String getHome() {
		return "homeEx";
	}
}
