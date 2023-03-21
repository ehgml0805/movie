package goodee.e1i6.movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.ReviewService;
import goodee.e1i6.movie.service.StillCutService;
import goodee.e1i6.movie.service.WishlistService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.MovieForm;
import goodee.e1i6.movie.vo.Review;
import goodee.e1i6.movie.vo.StillCut;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MovieController {
	@Autowired MovieService movieService;
	@Autowired StillCutService stillCutService;
	@Autowired ReviewService reviewService; 
	@Autowired WishlistService wishlistService;
	
	// 삭제
	@GetMapping("/employee/movie/removeMovie")
	public String removeMovie(@RequestParam(value="movieKey", required = true) int movieKey) {
		movieService.removeMovie(movieKey);
		return "redirect:/employee/movie/movieList";
	}
	
	// 영화 수정
	@GetMapping("/employee/movie/modifyMovie")
	public String modifyMovie(Model model
							, @RequestParam(value="movieKey", required = true) int movieKey) {
		ArrayList<Map<String, Object>> movie = movieService.getMovieOne(movieKey);
		model.addAttribute("movie", movie);
		log.debug(TeamColor.JYW+"movie : "+movie);
		
		model.addAttribute("movieKey", movieKey);
		
		List<StillCut> stillCuts = stillCutService.getStillCutList(movieKey);
		model.addAttribute("stillCuts", stillCuts);
		// log.debug(TeamColor.JYW+"stillCuts : "+stillCuts);
		
		return "/employee/movie/modifyMovie";
	}
	@PostMapping("/employee/movie/modifyMovie")
	public String modifyMovie(Model model, HttpServletRequest request, MovieForm movieForm) {
		String path = request.getServletContext().getRealPath("/stillCut-upload/");
		log.debug(TeamColor.JYW + "MovieController.modifyMovie path : " + path);
		
		log.debug(TeamColor.JYW + "MovieController.modifyMovie movieForm : " + movieForm);
		
		int row = movieService.modifyMovie(movieForm, path);
		// row != 0 이면 수정성공
		if(row == 0) {
			model.addAttribute("msg", "수정실패하였습니다.");
			log.debug(TeamColor.JYW + movieForm.getMovieKey());
			return "redirect:/employee/movie/modifyMovie?movieKey="+movieForm.getMovieKey();
		}
		
		return "redirect:/employee/movie/movieOne?movieKey="+movieForm.getMovieKey();
	}
	
	// 영화 등록
	@GetMapping("/employee/movie/addMovie")
	public String addMovie() {
		return "/employee/movie/addMovie";
	}
	@PostMapping("/employee/movie/addMovie")
	public String addMovie(Model model, HttpServletRequest request, MovieForm movieForm) {
		String path = request.getServletContext().getRealPath("/stillCut-upload/");
		log.debug(TeamColor.JYW + "MovieController.addMovie path : " + path);
		
		log.debug(TeamColor.JYW + "MovieController.addMovie movieForm : " + movieForm);
		
		int row = movieService.addMovie(movieForm, path);
		// row != 0 이면 입력성공
		if(row == 0) {
			model.addAttribute("msg", "등록실패하였습니다.");
			return "/employee/movie/addMovie";
		}
		
		return "redirect:/employee/movie/movieList";
	}
	
	// 영화 상세정보 출력
	@GetMapping("/employee/movie/movieOne")
	public String getMovieOneByEmployee(Model model
							, @RequestParam(value="movieKey", required = true) int movieKey) {
		// log.debug(TeamColor.JYW + "movieOne");
		
		ArrayList<Map<String, Object>> movie = movieService.getMovieOne(movieKey);
		model.addAttribute("movie", movie);
		
		return "/employee/movie/movieOne";
	}
	
	// 영화 목록 출력
	@GetMapping("/employee/movie/movieList")
	public String getMovieListByEmployee(Model model, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		// log.debug(TeamColor.JYW + "GET movieList");
		
		ArrayList<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		model.addAttribute("movieList", movieList);
		
		return "/employee/movie/movieList";
	}
	
	// 영화 상세정보 출력
	@GetMapping("/movie/movieOne")
	public String getMovieOne(Model model
							, @RequestParam(value="movieKey", required = true) int movieKey
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		// log.debug(TeamColor.JYW + "movieOne");
		
		ArrayList<Map<String, Object>> movie = movieService.getMovieOne(movieKey);
		model.addAttribute("movie", movie);
		for(Map<String, Object> m: movie) {
			int mKey= (int) m.get("movieKey");
			model.addAttribute("mKey", mKey);
		}
		
		List<Review> rlist= reviewService.selectReviewList(currentPage, rowPerPage, movieKey);
		model.addAttribute("rlist", rlist);
		
		return "/customer/movie/movieOne";
	}
	
	// 영화 목록 출력
	@GetMapping("/movie/movieList")
	public String getMovieList(Model model, HttpSession session
							, @RequestParam(value = "startDate", defaultValue = "") String startDate
							, @RequestParam(value = "customerId", defaultValue = "") String customerId) {
		// log.debug(TeamColor.JYW + "GET movieList");
		
		ArrayList<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		model.addAttribute("movieList", movieList);
		
		if(session.getAttribute("loginCustomer") != null) { // 로그인 아이디가 있으면 내가 찜한영화 확인가능
			Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
			customerId = loginCustomer.getCustomerId();
		}
		List<Map<String, Object>> wishlistCount = wishlistService.getWishlistById(customerId);
		model.addAttribute("wishlistCount", wishlistCount);
		model.addAttribute("customerId", customerId);
		
		return "/customer/movie/movieList";
	}
}