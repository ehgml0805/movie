package goodee.e1i6.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.service.NoticeService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Notice;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	@GetMapping("/employee/notice/addNotice")
		public String addNotice() {
			return "employee/addNotice";
		}
	@PostMapping("/employee/notice/addnotice")
		public String addNotice(@RequestParam(value="noticeTitle") String noticeTitle
								, @RequestParam(value="noticeContent") String noticeContent
								, MultipartFile img
								, Notice notice) {
		log.debug(TeamColor.YIB + noticeTitle);
		log.debug(TeamColor.YIB + noticeContent);
		log.debug(TeamColor.YIB + img.getOriginalFilename());
		
		
		return "";
	}
	
	
	
}
