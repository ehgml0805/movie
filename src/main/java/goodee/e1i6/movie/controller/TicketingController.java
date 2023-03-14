package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.e1i6.movie.service.MovieService;

@Controller
public class TicketingController {
	@Autowired MovieService movieService;
	
	@GetMapping("/ticketing/screenList")
	public String getScreenList(Model model) {
		List<Map<String, Object>> movieList = movieService.getMovieList();
		model.addAttribute("movieList", movieList);	
		
		return "/customer/ticketing/screenList";
	}
}
