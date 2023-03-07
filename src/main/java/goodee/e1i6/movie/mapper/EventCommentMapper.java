package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.EventComment;

@Mapper
public interface EventCommentMapper {
	// count
	int eventCommentCount();
	// 이벤트 댓글 등록
	int insertEventComment(EventComment eventComment);
	// 이벤트 댓글 리스트
	List<EventComment> selectEventCommentList(Map<String, Object>paraMap);
}
