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
	
	//리뷰 신고 - 욕설 비방
	@GetMapping("/customer/review/insultReport")
	public String insultReport( @RequestParam(value="customerId") String customerId
								, @RequestParam(value = "ticketingKey") int ticketingKey
								, @RequestParam(value="movieKey") int movieKey) {
		
		int row=reviewService.insultReport(ticketingKey, customerId);
		if(row==1) {
			log.debug(TeamColor.KDH+ row +"<==1: 욕설/비방 신고 성공");
			
		}else {
			log.debug(TeamColor.KDH+ row +"<==0: 욕설/비방 신고 실패");
		}
		
		List<Review> rlist= reviewService.selectReviewList(1, 1, movieKey);
		for(Review r: rlist) { 
			int insultReport =(int) r.getInsultReport();
			log.debug(TeamColor.KDH + insultReport + "<==욕설비방 신고 횟수");
			if(insultReport==5) { 
				int reportCategoryKey=1; 
				int row3=blackListService.insultBlackList(customerId, reportCategoryKey); 
				log.debug(TeamColor.KDH+ row3 + "<==블랙리스트 추가 성공");
			 } 
			 
		 }
		return "redirect:/movie/movieOne?&movieKey="+movieKey;
	}
	//리뷰 신고 - 스포일러
		@GetMapping("/customer/review/spoilerReport")
		public String spoilerReport( @RequestParam(value="customerId") String customerId
									, @RequestParam(value = "ticketingKey") int ticketingKey
									, @RequestParam(value="movieKey") int movieKey) {
			int row=reviewService.spoilerReport(ticketingKey, customerId);
			if(row==1) {
				log.debug(TeamColor.KDH+ row +"<==1: 스포일러 신고 성공");
			
			}else {
				log.debug(TeamColor.KDH+ row +"<==0: 스포일러 신고 실패");
				
			}

			List<Review> rlist= reviewService.selectReviewList(1, 1, movieKey);
			for(Review r: rlist) { 
				int spoilerReport =(int) r.getSpoilerReport();
				log.debug(TeamColor.KDH + spoilerReport + "<==스포일러 신고 횟수");
				if(spoilerReport==10) { 
					int reportCategoryKey=2; 
					int row3=blackListService.spoilerBlackList(customerId, reportCategoryKey); 
					log.debug(TeamColor.KDH+ row3 + "<==블랙리스트 추가 성공");
				 } 
				 
			 }
			
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
