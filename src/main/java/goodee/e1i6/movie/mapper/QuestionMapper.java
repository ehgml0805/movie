package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Question;
import goodee.e1i6.movie.vo.QuestionCategory;

@Mapper
public interface QuestionMapper {

	// 공지사항 삭제
	int deleteQuestion(int questionKey);
	// 공지사항 수정
	int updateQuestion(Map<String, Object> paramMap);
	// 공지사항 내용
	Map<String, Object> selectQuestionOne(int questionKey);
	// 공지사항 리스트 마지막페이지
	int selectQuestionListCount();
	// 공지사항 리스트
	List<Question> selectQuestionList(Map<String, Object> paramMap);
	// 문의유형 리스트
	List<QuestionCategory> selectQuestionCategoryList();
	// 공지사항 등록
	int insertQuestion(Question question);
}
