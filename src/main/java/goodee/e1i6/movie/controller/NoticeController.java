package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.e1i6.movie.service.NoticeService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Notice;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	
	// 공지사항 삭제
	@GetMapping("/employee/notice/removeNotice")
	public String removeNotice(@RequestParam(value="noticeKey") int noticeKey
									, @RequestParam(value="fileName", defaultValue="") String fileName
									, HttpServletRequest request) {
		log.debug(TeamColor.YIB + noticeKey + " : noticeKey");
		log.debug(TeamColor.YIB + fileName + " : fileName");
		// 이미지파일이 있으면 삭제를 위해 파일업로드 위치
		String path = request.getServletContext().getRealPath("/notice-upload/");
		noticeService.removeNotice(noticeKey, path, fileName);
		log.debug(TeamColor.YIB + noticeKey + ": 삭제완료");
		return "redirect:/employee/notice/noticeList";
	}
	
	// 공지사항 수정 폼
	@GetMapping("/employee/notice/modifyNotice")
	public String modifyNotice(Model model
									, @RequestParam(value="noticeKey") int noticeKey
									, @RequestParam(value="noticeTitle") String noticeTitle
									, @RequestParam(value="noticeContent") String noticeContent) {
		log.debug(TeamColor.YIB + noticeKey + " : noticeKey");
		log.debug(TeamColor.YIB + noticeTitle + " : noticeTitle");
		log.debug(TeamColor.YIB + noticeContent + " : noticeContent");
		model.addAttribute("noticeKey", noticeKey);
		model.addAttribute("noticeTitle", noticeTitle);
		model.addAttribute("noticeContent", noticeContent);
		
		return "employee/notice/modifyNotice";
	}
	// 공지사항 수정 액션
	@PostMapping("/employee/notice/modifyNotice")
	public String modifyNotice(@RequestParam(value="noticeKey") int noticeKey
									, @RequestParam(value="newTitle") String newTitle
									, @RequestParam(value="newContent") String newContent
									, RedirectAttributes re) {
		log.debug(TeamColor.YIB + noticeKey + " : noticeKey");
		log.debug(TeamColor.YIB + newTitle + " : newTitle");
		log.debug(TeamColor.YIB + newContent + " : newContent");
		noticeService.modifyNoticeOne(noticeKey, newTitle, newContent);
		re.addAttribute("noticeKey", noticeKey);
		return "redirect:/employee/notice/noticeOne";
	}
	
	// 공지사항 내용(customer)
	@GetMapping("/notice/noticeOne")
	public String noticeOneCustomer(Model model, @RequestParam(value="noticeKey") int noticeKey) {
		Map<String, Object> map = noticeService.getNoticeOne(noticeKey);
		model.addAttribute("map", map);
		return "customer/notice/noticeOne";
	}
	// 공지사항 내용(employee)
	@GetMapping("/employee/notice/noticeOne")
	public String noticeOne(Model model, @RequestParam(value="noticeKey") int noticeKey) {
		Map<String, Object> map = noticeService.getNoticeOne(noticeKey);
		model.addAttribute("map", map);
		return "employee/notice/noticeOne";
	}
	
	// 공지사항 리스트(customer)
	@GetMapping("/notice/noticeList")
	public String noticeListCustomer(Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="5") int rowPerPage
									, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		// 마지막페이지
		int noticeCount = noticeService.getNoticeListCount();
		int lastPage = noticeCount / rowPerPage;
		if(noticeCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// startPage
		int startPage = ((currentPage - 1)/rowPerPage) * rowPerPage + 1;
		// endPage
		int endPage = startPage + rowPerPage - 1;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		log.debug(TeamColor.YIB + noticeCount + " : noticeCount");
		log.debug(TeamColor.YIB + lastPage + " : lastPage");
		log.debug(TeamColor.YIB + startPage + " : startPage");
		log.debug(TeamColor.YIB + endPage + " : endPage");
		
		// 리스트
		List<Notice> list = noticeService.getNoticeList(currentPage, rowPerPage, searchWord);
		// view로 전달
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchWord", searchWord);
		return "customer/notice/noticeList";
	}
	// 공지사항 리스트(employee)
	@GetMapping("/employee/notice/noticeList")
	public String noticeList(Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
									, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		// 마지막페이지
		int noticeCount = noticeService.getNoticeListCount();
		int lastPage = noticeCount / rowPerPage;
		if(noticeCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// startPage
		int startPage = ((currentPage - 1)/rowPerPage) * rowPerPage + 1;
		// endPage
		int endPage = startPage + rowPerPage - 1;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		log.debug(TeamColor.YIB + noticeCount + " : noticeCount");
		log.debug(TeamColor.YIB + lastPage + " : lastPage");
		log.debug(TeamColor.YIB + startPage + " : startPage");
		log.debug(TeamColor.YIB + endPage + " : endPage");
		
		// 리스트
		List<Notice> list = noticeService.getNoticeList(currentPage, rowPerPage, searchWord);
		// view로 전달
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchWord", searchWord);
		return "employee/notice/noticeList";
	}
	
	// 공지사항 등록 폼
	@GetMapping("/employee/notice/addNotice")
	public String addNotice() {
		return "employee/notice/addNotice";
	}
	// 공지사항 등록 액션
	@PostMapping("/employee/notice/addNotice")
	public String addNotice(@RequestParam(value="noticeTitle") String noticeTitle
							, @RequestParam(value="noticeContent") String noticeContent
							, MultipartFile img
							, HttpServletRequest request) {
	log.debug(TeamColor.YIB + noticeTitle + " : noticeTitle");
	log.debug(TeamColor.YIB + noticeContent + " : noticeContent");
	log.debug(TeamColor.YIB + img.getOriginalFilename() + " : img");
	log.debug(TeamColor.YIB + img.getSize() + " : img");
	// 파일업로드 위치
	String path = request.getServletContext().getRealPath("/notice-upload/");
	noticeService.addNotice(noticeTitle, noticeContent, path, img);

	return "redirect:/employee/notice/noticeList";
	}
	
	
	
}
