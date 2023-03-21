package goodee.e1i6.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.QuestionMapper;
import goodee.e1i6.movie.vo.Question;
import goodee.e1i6.movie.vo.QuestionAnswer;
import goodee.e1i6.movie.vo.QuestionCategory;
import goodee.e1i6.movie.vo.Theater;

@Service
@Transactional
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;
	
	// 지역선택 후 극장목록
	public List<Theater> getTheaterNameListByRegion(String theaterRegion) {
		return questionMapper.selectTheaterNameListByRegion(theaterRegion);
	}
	
	// 내문의사항 삭제
	public int removeQuestionAnswer(int questionKey) {
		return questionMapper.deleteQuestionAnswer(questionKey);
	}
	
	// 내문의사항 등록
	public int addQuestionAnswer(int questionKey, String questionAnswer) {
		QuestionAnswer qa = new QuestionAnswer();
		qa.setQuestionKey(questionKey);
		qa.setQuestionAnswer(questionAnswer);
		return questionMapper.insertQuestionAnswer(qa);
	}
	
	// 고객 문의사항 내용, 답변(관리자)
	public Map<String, Object> getQuestionOneAndAnswerByAdmin(int questionKey) {
		return questionMapper.selectQuestionOneAndAnswerByAdmin(questionKey);
	}
	
	// 문의 리스트 마지막페이지(관리자)
	public int getQuestionListCountByAdmin() {
		return questionMapper.selectQuestionListCountByAdmin();
	}
	// 문의 리스트(관리자)
	public List<Map<String, Object>> getQuestionListByAdmin(int currentPage, int rowPerPage) {
		int beginRow = (currentPage -1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return questionMapper.selectQuestionListByAdmin(paramMap);
	}
	
	// 내문의사항 수정
	public int modifyQuestion(int questionKey, String customerId, String questionTitle, String questionContent) {
		Question question = new Question();
		question.setQuestionKey(questionKey);
		question.setCustomerId(customerId);
		question.setQuestionTitle(questionTitle);
		question.setQuestionContent(questionContent);
		return questionMapper.updateQuestion(question);
	}
	
	// 내문의사항 내용, 답변
	public Map<String, Object> getQuestionOneAndAnswer(String customerId, int questionKey) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("questionKey", questionKey);
		return questionMapper.selectQuestionOneAndAnswer(paramMap);
	}
	
	// 내문의사항 삭제
	public int removeQuestion(int questionKey) {
		return questionMapper.deleteQuestion(questionKey);
	}
	
	// 내문의 리스트 마지막페이지
	public int getQuestionListCount(String customerId) {
		return questionMapper.selectQuestionListCount(customerId);
	}
	// 내문의 리스트
	public List<Map<String, Object>> getQuestionList(String customerId, int currentPage, int rowPerPage) {
		int beginRow = (currentPage -1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerId", customerId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return questionMapper.selectQuestionList(paramMap);
	}
	
	// 문의유형 리스트
	public List<QuestionCategory> getQuestionCategoryList() {
		return questionMapper.selectQuestionCategoryList();
	}
	
	// 내문의사항 등록
	public int addQuestion(String questionTitle, String customerId, int questionCategoryKey, int theaterKey, String questionContent) {
		Question question = new Question();
		question.setQuestionTitle(questionTitle);
		question.setCustomerId(customerId);
		question.setQuestionCategoryKey(questionCategoryKey);
		question.setTheaterKey(theaterKey);
		question.setQuestionContent(questionContent);
		
		return questionMapper.insertQuestion(question);
	}
}
