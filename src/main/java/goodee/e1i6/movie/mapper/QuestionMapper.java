package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Question;
import goodee.e1i6.movie.vo.QuestionCategory;

@Mapper
public interface QuestionMapper {


	// 내문의사항 수정
	int updateQuestion(Question question);
	// 내문의사항 내용, 답변
	Map<String, Object> selectQuestionOneAndAnswer(Map<String, Object> paramMap);
	// 내문의사항 삭제
	int deleteQuestion(int questionKey);
	// 내문의 리스트 마지막페이지
	int selectQuestionListCount(String customerId);
	// 내문의 리스트
	List<Map<String, Object>> selectQuestionList(Map<String, Object> paramMap);
	// 문의유형 리스트
	List<QuestionCategory> selectQuestionCategoryList();
	// 공지사항 등록
	int insertQuestion(Question question);
}
