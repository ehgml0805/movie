package goodee.e1i6.movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.e1i6.movie.service.ReviewService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Review;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	
	@PostMapping("/customer/review/addReview")
	public String addReview (HttpSession session, Review review) {
		int row= reviewService.addReview(review);
		if(row==0) {
			log.debug(TeamColor.KDH+row+"<==0: 리뷰 작성 실패");
		}
		log.debug(TeamColor.KDH+row+"<==1: 리뷰 작성 성공");
		
		return "redirect:/customer/review/reviewList";
	}
	
	
}
