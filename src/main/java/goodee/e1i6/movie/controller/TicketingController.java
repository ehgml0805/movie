package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.TheaterService;

@Controller
public class TicketingController {
	@Autowired MovieService movieService;
	@Autowired TheaterService theaterService;
	
	@GetMapping("/ticketing/screenList")
	public String getScreenList(Model model
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey) {
		List<Map<String, Object>> movieList = movieService.getMovieList();
		List<Map<String, Object>> theaterRegionList = theaterService.getTheaterRegionList();
		
		model.addAttribute("theaterRegionList", theaterRegionList);
		model.addAttribute("movieList", movieList);	
		
		model.addAttribute("movieKey", movieKey);
		
		return "/customer/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/screenList2")
	public String getScreenList2(Model model
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey) {
		List<Map<String, Object>> movieList = movieService.getMovieList();
		List<Map<String, Object>> theaterRegionList = theaterService.getTheaterRegionList();
		
		model.addAttribute("theaterRegionList", theaterRegionList);
		model.addAttribute("movieList", movieList);	
		
		model.addAttribute("movieKey", movieKey);
		
		return "/customer/ticketing/screenList2";
	}
}
