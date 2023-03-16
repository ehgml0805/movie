package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.QuestionService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.QuestionCategory;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	
	// 문의사항 등록 폼
	@GetMapping("/customer/question/addQuestion")
	public String addQuestion (Model model) {
		log.debug(TeamColor.YIB + "문의사항 등록 폼--");
		// 문의유형 리스트
		List<QuestionCategory> categoryList = questionService.getQuestionCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "customer/question/addQuestion";
	}
	// 문의사항 등록 액션
	@PostMapping("/customer/question/addQuestion")
	public String addQuestion (HttpSession session
											, @RequestParam(value="questionTitle") String questionTitle
											, @RequestParam(value="theaterName") String theaterName
											, @RequestParam(value="theaterRegion") String theaterRegion
											, @RequestParam(value="questionCategoryKey") int questionCategoryKey
											, @RequestParam(value="questionContent") String questionContent) {
		log.debug(TeamColor.YIB + questionTitle + ": questionTitle");
		log.debug(TeamColor.YIB + theaterName + ": theaterName");
		log.debug(TeamColor.YIB + theaterRegion + ": theaterRegion");
		log.debug(TeamColor.YIB + questionCategoryKey + ": questionCategoryKey");
		log.debug(TeamColor.YIB + questionContent + ": questionContent");
		Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		questionService.addQuestion(questionTitle, customerId, questionCategoryKey, questionCategoryKey, questionContent);
		return "rediect:/customer/question/questionList";
	}
	
}
