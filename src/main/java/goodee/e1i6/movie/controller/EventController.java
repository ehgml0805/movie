package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.service.EventService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Event;
import goodee.e1i6.movie.vo.EventComment;
import goodee.e1i6.movie.vo.EventForm;
import goodee.e1i6.movie.vo.EventWinner;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.ScreeningSchedule;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EventController {
	@Autowired EventService eventService;
	// 이벤트 당첨자 추가
	@GetMapping("/employee/event/eventWinner")
	public String eventWinner() {
		return "employee/event/eventWinner";
	}
	
	@PostMapping("/employee/event/eventWinner")
	public String eventWinner(EventWinner eventWinner) {
		eventService.addEventWinner(eventWinner);
		return "redirect:/employee/event/eventWinnerList";
	}

	// 이벤트 당첨자 리스트
	@GetMapping("/event/eventWinnerList")
	public String eventWinnerList(Model model, @RequestParam("eventKey") int eventKey) {
	
		List<EventWinner> list = eventService.getEventWinnerList(eventKey);
		log.debug(TeamColor.JSM + "EventWinnerList :" + list);
		
		model.addAttribute("list", list);
		return "customer/event/eventWinnerList";
	}
	
	// 이벤트 댓글 삭제
	@GetMapping("/customer/event/removeEventComment")
	public String removeEventComment(@RequestParam("eventCommentKey") int eventCommentKey) {
		eventService.removeComment(eventCommentKey);
		return "redirect:/event/eventOne";
	}
	
	// 이벤트 댓글 수정
	@GetMapping("/customer/event/modifyEventComment")
	public String modifyEventComment(Model model, @RequestParam(value="eventCommentKey") int eventCommentKey) {
		model.addAttribute("eventCommentKey", eventCommentKey);
		return "customer/event/modifyEventComment";
	}	
	@PostMapping("/customer/event/modifyEventComment")
	public String modifyEventComment(EventComment eventComment) {
		eventService.modifyEventComment(eventComment);
		int eventKey = eventComment.getEventKey();
		log.debug(TeamColor.JSM + eventComment + " <- modifyEventComment");
		return "redirect:/event/eventOne?eventKey="+eventKey;
	}
	
	// 이벤트 댓글 추가
	@GetMapping("/event/addEventComment")
	public String addEventComment(Model model, int eventKey, @RequestParam(value="customerId") String customerId) {
		List<ScreeningSchedule> eventScheduleList = eventService.getEventScheduleList();
		
		log.debug(TeamColor.JSM + "eventScheduleList: " + eventScheduleList);
		log.debug(TeamColor.JSM + "addCommentEventKey :" + eventKey);
		
		model.addAttribute("eventScheduleList", eventScheduleList);
		model.addAttribute("eventKey", eventKey);
		model.addAttribute("customerId", customerId);
		
		return "customer/event/addEventComment";
	}
	@PostMapping("/event/addEventComment")
	public String addEventComment(EventComment eventComment) {	
	    int eventKey = eventComment.getEventKey();
	    // log.debug(TeamColor.JSM + "eventKey " + eventKey);
		eventService.addEventComment(eventComment);
		return "redirect:/event/eventOne?eventKey="+eventKey;
	}
	// 이벤트 댓글 리스트 
	@GetMapping("/event/eventCommentList")
	public String eventCommentList (Model model 
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "5") int rowPerPage
			, @RequestParam(value = "eventKey") int eventKey){ 
		
		log.debug(TeamColor.JSM + "ec.eventKey :" + eventKey);
		
		List<EventComment> EventCommentList = eventService.getEventCommentList(currentPage, rowPerPage, eventKey);
		log.debug(TeamColor.JSM + EventCommentList +" <- EventCommentList");
		
		int eventCommentCount = eventService.eventCommentCount(eventKey);
		log.debug(TeamColor.JSM + "eventCommentCount :" + eventCommentCount);

		int lastPage = (int)Math.ceil((double)eventCommentCount / (double)rowPerPage);
		
		int startPage = ((currentPage - 1) / 10) * 10 + 1;
		int endPage = startPage + 9;

		if (endPage > lastPage) {
		    endPage = lastPage;
		}
		
		model.addAttribute("EventCommentList", EventCommentList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("eventCommentCount", eventCommentCount);
		model.addAttribute("endPage", endPage);
		model.addAttribute("eventKey", eventKey);

		
		return "customer/event/eventCommentList";
	}
	
	// 이벤트 상세보기
	@GetMapping("/event/eventOne")
	public String eventOne(Model model, Event event, HttpSession session) {
		List<Event> eventOneList = eventService.getEventOne(event);
		log.debug(TeamColor.JSM + eventOneList +" <- eventOnelist");
		log.debug(TeamColor.JSM + event.getEventKey() +" <- eventKey");
		
		String customerId;
		
		Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
		if(loginCustomer == null) {
			 customerId = "";
		} else {
			 customerId = loginCustomer.getCustomerId();
		}
		
		log.debug(TeamColor.JSM + customerId +" <- eventOneCustomerId");
		
		model.addAttribute("eventOneList", eventOneList);
		model.addAttribute("eventKey", event.getEventKey());
		model.addAttribute("customerId", customerId);
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
		return "redirect:/event/eventList";
	}
	// 종료된 이벤트 리스트
	@GetMapping("/event/endEventList")
	public String EndEventList (Model model 
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
		    , @RequestParam(value="searchWord", defaultValue = "") String searchWord) { 
	
		List<Event> list = eventService.getEndEventList(currentPage, rowPerPage, searchWord);
		log.debug(TeamColor.JSM + list +" <- endEventList");
		
		int count = eventService.endEventCount(searchWord, currentPage, rowPerPage);
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage);
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
		return "customer/event/endEventList";
	}
	
	// 이벤트 리스트
	@GetMapping("/event/eventList")
	public String eventList (Model model 
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
		    , @RequestParam(value="searchWord", defaultValue = "") String searchWord) { 
	
		List<Event> list = eventService.getEventList(currentPage, rowPerPage, searchWord);
		log.debug(TeamColor.JSM + list +" <- eventList");
		
		int count = eventService.eventCount(searchWord, currentPage, rowPerPage);
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage);
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
