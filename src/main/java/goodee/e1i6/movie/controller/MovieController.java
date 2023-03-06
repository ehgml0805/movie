package goodee.e1i6.movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MovieController {
	
	@GetMapping("/index")
	public String loginEmp(HttpSession session) {
		return "index";
	}
}
