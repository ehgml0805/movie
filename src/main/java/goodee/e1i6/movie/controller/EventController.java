package goodee.e1i6.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.e1i6.movie.service.EventService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EventController {
	@Autowired EventService eventService;
	
	// 이벤트 추가
	@GetMapping("/employee/event/addEvent")
	public String addEvent() {
		return "";
	}
}
