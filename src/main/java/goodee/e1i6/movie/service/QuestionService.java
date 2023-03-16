package goodee.e1i6.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.QuestionMapper;
import goodee.e1i6.movie.vo.Question;
import goodee.e1i6.movie.vo.QuestionCategory;

@Service
@Transactional
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;
	
	// 문의유형 리스트
	public List<QuestionCategory> getQuestionCategoryList() {
		return questionMapper.selectQuestionCategoryList();
	}
	
	// 문의사항 등록
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
