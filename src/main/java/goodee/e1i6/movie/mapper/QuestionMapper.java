package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Question;
import goodee.e1i6.movie.vo.QuestionAnswer;
import goodee.e1i6.movie.vo.QuestionCategory;
import goodee.e1i6.movie.vo.Theater;

@Mapper
public interface QuestionMapper {

	// 지역선택 후 극장목록(rest)
	List<Theater> selectTheaterNameListByRegion(String theaterRegion);
	// 답변 삭제(관리자)
	int deleteQuestionAnswer(int questionKey);
	// 답변 등록(관리자)
	int insertQuestionAnswer(QuestionAnswer questionAnswer);
	// 문의사항 내용, 답변(관리자)
	Map<String, Object> selectQuestionOneAndAnswerByAdmin(int questionKey);
	// 문의 리스트 마지막페이지(관리자)
	int selectQuestionListCountByAdmin();
	// 문의 리스트(관리자)
	List<Map<String, Object>> selectQuestionListByAdmin(Map<String, Object> paramMap);
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
	// 내문의사항 등록
	int insertQuestion(Question question);
}
