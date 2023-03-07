package goodee.e1i6.movie.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.teamColor.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MovieController {
	@Autowired MovieService movieService;
	
	// 영화 목록 출력
	@GetMapping("/movie/movieList")
	public String getMovieList(Model model) {
		log.debug(TeamColor.CHOI + "GET movieList");
		
		ArrayList<Map<String, Object>> movieList = movieService.getMovieList();
		model.addAttribute("movieList", movieList);
		
		return "/movie/movieList";
	}
}