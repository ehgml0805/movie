package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Review;

@Mapper
public interface ReviewMapper {
	
	
	//스포일러 신고 업데이트
	int spoilerReport(int ticketingKey, String customerId);
	//욕설, 비방 신고 업데이트
	int insultReport(int ticketingKey, String customerId);
	
	//리뷰삭제?
	int deleteReview(int ticketing_key, String customerId);
	//리뷰수정
	int updateReview(Review review);
	//리뷰 작성
	int insertReview(Review review);
	//리뷰 페이징 총 개수
	int selectCount();
	//리뷰 리스트 출력
	List<Review> selectReviewList(Map<String, Object> paramMap);
	List<Review> ReviewList();
}
