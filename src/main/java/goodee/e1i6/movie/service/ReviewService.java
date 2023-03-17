package goodee.e1i6.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.ReviewMapper;
import goodee.e1i6.movie.vo.Review;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class ReviewService {
	@Autowired private ReviewMapper reviewMapper;
	@Autowired BlackListService blackListService;
	
	//스포일러 신고 업데이트
	public int spoilerReport(int ticketingKey,String customerId) {
		return reviewMapper.spoilerReport(ticketingKey, customerId);
	}
	
	//욕설, 비방 신고 업데이트
	public int insultReport(int ticketingKey,String customerId) {
		return reviewMapper.insultReport(ticketingKey, customerId);
	}
	
	//리뷰 작성
	public int addReview(Review review) {
		return reviewMapper.insertReview(review);
	}
	
	//리뷰 페이징 총 개수
	public int selectCount () {
		return reviewMapper.selectCount();
	}
	//리뷰 리스트
	public List<Review> selectReviewList(int currentPage, int rowPerPage, int movieKey){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage); 
		paramMap.put("movieKey", movieKey); //몇개씩 보여줄거
		return reviewMapper.selectReviewList(paramMap);
	}
	
	//리뷰 리스트
	public List<Review> ReviewList(){
		return reviewMapper.ReviewList();
	}
}
