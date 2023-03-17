package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

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
	
	// 내문의사항 수정
	@GetMapping("/customer/question/modifyQuestion")
	public String modifyQuestion(Model model
										, @RequestParam(value="questionKey") int questionKey
										, @RequestParam(value="theaterRegion") String theaterRegion
										, @RequestParam(value="theaterName") String theaterName
										, @RequestParam(value="questionCategory") String questionCategory
										, @RequestParam(value="questionTitle") String questionTitle
										, @RequestParam(value="questionContent") String questionContent) {
		log.debug(TeamColor.YIB + "내문의사항 수정 폼--");
		log.debug(TeamColor.YIB + questionKey + " : questionKey");
		log.debug(TeamColor.YIB + theaterRegion + " : theaterRegion");
		log.debug(TeamColor.YIB + theaterName + " : theaterName");
		log.debug(TeamColor.YIB + questionCategory + " : questionCategory");
		log.debug(TeamColor.YIB + questionTitle + " : questionTitle");
		log.debug(TeamColor.YIB + questionContent + " : questionContent");
		model.addAttribute("questionKey", questionKey);
		model.addAttribute("theaterRegion", theaterRegion);
		model.addAttribute("theaterName", theaterName);
		model.addAttribute("questionCategory", questionCategory);
		model.addAttribute("questionTitle", questionTitle);
		model.addAttribute("questionContent", questionContent);
		return "customer/question/modifyQuestion";
	}
	@PostMapping("/customer/question/modifyQuestion")
	public String modifyQuestion(HttpSession session
										, @RequestParam(value="questionKey") int questionKey
										, @RequestParam(value="questionTitle") String questionTitle
										, @RequestParam(value="questionContent") String questionContent) {
		log.debug(TeamColor.YIB + "내문의사항 수정 액션--");
		log.debug(TeamColor.YIB + questionKey + " : questionKey");
		log.debug(TeamColor.YIB + questionTitle + " : questionTitle");
		log.debug(TeamColor.YIB + questionContent + " : questionContent");
		
		// 로그인 아이디
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		
		questionService.modifyQuestion(questionKey, customerId, questionTitle, questionContent);
		return "redirect:/customer/question/questionList";
	}
	
	// 내문의사항 내용, 답변
	@GetMapping("/customer/question/questionOne")
	public String getQuestionOneAndAnswer(Model model, HttpSession session, @RequestParam(value="questionKey") int questionKey) {
		log.debug(TeamColor.YIB + "내문의사항 내용, 답변--");
		log.debug(TeamColor.YIB + questionKey + " : questionKey");
		
		// 로그인 아이디
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		
		Map<String, Object> map = questionService.getQuestionOneAndAnswer(customerId, questionKey);
		
		model.addAttribute("map", map);
		return "customer/question/questionOne";
	}
	
	// 내문의사항 삭제
	@GetMapping("/customer/question/removeQuestion")
	public String removeQuestion(@RequestParam(value="questionKey") int questionKey) {
		log.debug(TeamColor.YIB + "문의사항 삭제--");
		log.debug(TeamColor.YIB + questionKey + " : questionKey");
		questionService.removeQuestion(questionKey);
		return "redirect:/customer/question/questionList";
	}
	
	// 내문의 리스트
	@GetMapping("/customer/question/questionList")
	public String getQuestionList(Model model, HttpSession session
											, @RequestParam(value="currentPage", defaultValue="1") int currentPage
											, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		log.debug(TeamColor.YIB + "문의사항 리스트--");
		// 로그인 아이디
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		
		// 마지막페이지
		int questionCount = questionService.getQuestionListCount(customerId);
		int lastPage = questionCount / rowPerPage;
		if(questionCount % rowPerPage != 0) {
			lastPage += 1;
		}
		log.debug(TeamColor.YIB + questionCount + " : questionCount");
		log.debug(TeamColor.YIB + lastPage + " : lastPage");
		
		// 리스트
		List<Map<String, Object>> list = questionService.getQuestionList(customerId, currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "customer/question/questionList";
	}
	
	// 문의사항 등록 폼
	@GetMapping("/customer/question/addQuestion")
	public String addQuestion(Model model) {
		log.debug(TeamColor.YIB + "문의사항 등록 폼--");
		// 문의유형 리스트
		List<QuestionCategory> categoryList = questionService.getQuestionCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "customer/question/addQuestion";
	}
	// 문의사항 등록 액션
	@PostMapping("/customer/question/addQuestion")
	public String addQuestion(HttpSession session
											, @RequestParam(value="questionTitle") String questionTitle
											, @RequestParam(value="theaterName") int theaterKey
											, @RequestParam(value="theaterRegion") String theaterRegion
											, @RequestParam(value="questionCategoryKey") int questionCategoryKey
											, @RequestParam(value="questionContent") String questionContent) {
		log.debug(TeamColor.YIB + questionTitle + ": questionTitle");
		log.debug(TeamColor.YIB + theaterKey + ": theaterKey");
		log.debug(TeamColor.YIB + theaterRegion + ": theaterRegion");
		log.debug(TeamColor.YIB + questionCategoryKey + ": questionCategoryKey");
		log.debug(TeamColor.YIB + questionContent + ": questionContent");
		// 로그인 아이디
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();

		// 문의사항 등록
		questionService.addQuestion(questionTitle, customerId, questionCategoryKey, theaterKey, questionContent);
		return "redirect:/customer/question/questionList";
	}
	
}
