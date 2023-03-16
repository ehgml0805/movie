package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.BlackListService;
import goodee.e1i6.movie.service.ReviewService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Review;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	@Autowired BlackListService blackListService;
	//리뷰 삭제
	
	//리뷰 신고
	@GetMapping("/customer/review/report")
	public String spoilerReport( @RequestParam(value="customerId") String customerId
								, @RequestParam(value = "ticketingKey") int ticketingKey
								, @RequestParam(value="movieKey") int movieKey) {
		int row1=reviewService.spoilerReport(ticketingKey, customerId);
		
		int row2=reviewService.insultReport(ticketingKey, customerId);
		if(row1==1 || row2==1) {
			log.debug(TeamColor.KDH+ row1 +"<==1: 스포일러 신고 성공");
			log.debug(TeamColor.KDH+ row2 +"<==1: 욕설/비방 신고 성공");
		}else {
			log.debug(TeamColor.KDH+ row1 +"<==0: 스포일러 신고 실패");
			log.debug(TeamColor.KDH+ row2 +"<==0: 욕설/비방 신고 실패");
		}
		
		/*
		 * List<Review> rlist= reviewService.ReviewList(); for(Review r: rlist) { int
		 * insultReport =(int) r.getInsultReport(); if(insultReport==5) { int
		 * reportCategoryKey=2; int row3=blackListService.addBlackList(customerId,
		 * reportCategoryKey); } }
		 */
		
		return "redirect:/movie/movieOne?&movieKey="+movieKey;
	}
	
	//리뷰작성
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
