package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.FaqService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Faq;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FaqController {
	@Autowired FaqService faqService;
	
	// removeFaq
	@GetMapping("/employee/faq/removeFaq")
	public String removeFaq(Faq faq) {
		faqService.removeFaq(faq);
		return "redirect:/faq/faqList";
	}
	
	
	// modifyFaq
	@GetMapping("/employee/faq/modifyFaq")
	public String modifyFaq(Model model
							, @RequestParam(value="faqKey") int faqKey
							, @RequestParam(value="faqQuestion") String faqQuestion
							, @RequestParam(value="faqAnswer") String faqAnswer) {
		model.addAttribute("faqKey", faqKey);
		model.addAttribute("faqQuestion", faqQuestion);
		model.addAttribute("faqAnswer", faqAnswer);
		return "employee/faq/modifyFaq";
	}
	
	@PostMapping("/employee/faq/modifyFaq")
	public String modifyFaq(Faq faq) {
		faqService.modifyFaq(faq);
		return "redirect:/faq/faqList";
	}
	
	// AddFaq
	@GetMapping("/employee/faq/addFaq")
	public String addFaq() {
		return "employee/faq/addFaq";
	}
	@PostMapping("/employee/faq/addFaq")
	public String addFaq(Faq faq) {
		faqService.addFaq(faq);
		return "redirect:/faq/faqList";
	}
	
	// Faq 리스트
	@GetMapping("/faq/faqList")
	public String faqList (Model model, HttpSession session 
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
		    , @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
	
		List<Faq> faqList = faqService.getFaqList(currentPage, rowPerPage, searchWord);	
		log.debug(TeamColor.JSM + faqList +" <- faqList");
		
		int count = faqService.faqCount(searchWord, currentPage, rowPerPage);
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage);
		int startPage = ((currentPage - 1) / 10) * 10 + 1;
		int endPage = startPage + 9;
	
		if (endPage > lastPage) {
		    endPage = lastPage;
		}
		
		if(session.getAttribute("loginEmployee") != null) {
			model.addAttribute("loginEmployee", session.getAttribute("loginEmployee"));
		}
		
		model.addAttribute("faqList", faqList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		
		return "customer/faq/faqList";
	}
}
