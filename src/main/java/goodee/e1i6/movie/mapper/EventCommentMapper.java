package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.EventComment;

@Mapper
public interface EventCommentMapper {
	
	//스포일러 신고 업데이트
	int spoilerReport(int eventCommentKey, String customerId);
	//욕설, 비방 신고 업데이트
	int insultReport(int eventCommentKey, String customerId);
	
	
	// count
	int eventCommentCount(int eventKey);
	// 이벤트 댓글 삭제
	int deleteEventComment(EventComment eventComment);
	// 이벤트 댓글 수정
	int updateEventComment(EventComment eventComment);
	// 이벤트 댓글 등록
	int insertEventComment(EventComment eventComment);
	// 이벤트 당첨자 댓글 리스트
	List<Map<String, Object>> selectEventWinnerCommentList(Map<String, Object>paraMap);
	// 이벤트 댓글 리스트
	List<EventComment> selectEventCommentList(Map<String, Object>paraMap);
}
