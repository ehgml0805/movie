package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.service.EventService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Event;
import goodee.e1i6.movie.vo.EventForm;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.ScreeningSchedule;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EventController {
	@Autowired EventService eventService;
	
	// 이벤트 상세보기 + 이벤트 댓글
	@GetMapping("/customer/event/eventOne")
	public String eventOne(Model model, Event event) {
		List<Event> eventOnelist = eventService.getEventOne(event);
		log.debug(TeamColor.JSM + eventOnelist +" <- eventOnelist");
		
		int eventCommentCount = eventService.eventCommentCount();
		log.debug(TeamColor.JSM + "eventCommentCount :" + eventCommentCount);
		
		List<ScreeningSchedule> eventScheduleList = eventService.getEventScheduleList();
		log.debug(TeamColor.JSM + eventScheduleList + " <- eventScheduleList");
		
		model.addAttribute("eventOnelist", eventOnelist);
		model.addAttribute("count", eventCommentCount);
		model.addAttribute("eventScheduleList", eventScheduleList);
		return "customer/event/eventOne";
	}
	
	
	// 이벤트 추가
	@GetMapping("/employee/event/addEvent")
	public String addEvent(Model model) {
		List<Movie> list = eventService.getEventMovieList();
		log.debug(TeamColor.JSM + list + " <- movieList");
		
		model.addAttribute("list", list);
		return "employee/event/addEvent";
	}
	
	@PostMapping("/employee/event/addEvent")
	public String addEvent(HttpServletRequest request, EventForm eventForm) {
		String path = request.getServletContext().getRealPath("/event-upload/");
		log.debug(TeamColor.JSM + path + " <- addEvent path");
		log.debug(TeamColor.JSM + eventForm + " <- eventForm :");
	
		List<MultipartFile> eventImgList = eventForm.getEventImgList();
		if(eventImgList.get(0).getSize() > 0) { // 하나 이상의 파일이 업로드 될 경우
			for(MultipartFile mf : eventImgList) {
				log.debug(TeamColor.JSM + mf.getOriginalFilename() + " <- addEvent fileName");
			}
		}
		
		eventService.addEvent(eventForm, path);
		return "redirect:/customer/event/eventList";
	}
	
	// 이벤트 리스트
	@GetMapping("/customer/event/eventList")
	public String eventList (Model model 
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
		    , @RequestParam(value="searchWord", defaultValue = "") String searchWord) { 
	
		List<Event> list = eventService.getEventList(currentPage, rowPerPage, searchWord);
		log.debug(TeamColor.JSM + list +" <- eventList");
		int lastPage = eventService.eventCount(searchWord, currentPage, rowPerPage);
		
		int startPage = ((currentPage - 1) / 10) * 10 + 1;
		int endPage = startPage + 9;

		if (endPage > lastPage) {
		    endPage = lastPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		
		return "customer/event/eventList";
	}
}
