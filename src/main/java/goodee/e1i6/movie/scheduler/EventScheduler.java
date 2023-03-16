package goodee.e1i6.movie.scheduler;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import goodee.e1i6.movie.mapper.EventMapper;
import goodee.e1i6.movie.service.EventService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Event;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@EnableScheduling
public class EventScheduler {
	@Autowired EventService eventService;
	@Autowired EventMapper eventMapper;
	// 이벤트 종료 다음날 00시에 실행
	@Scheduled (cron = "0 0 0 * * *") // 30초마다 실행  (fixedRate = 30000)
    public void eventWinners() {
		log.debug(TeamColor.JSM + "실행테스트");
		List<Event> pastEvents = eventMapper.selectPastEvents();
		log.debug(TeamColor.JSM + "pastEvents" + pastEvents);
		if (pastEvents != null && !pastEvents.isEmpty()) {
	        for(Event event : pastEvents) {    
	        	log.debug(TeamColor.JSM + "event.getEventEndDate()" + event.getEventEndDate());
	        	LocalDate endDate = LocalDate.parse(event.getEventEndDate());
	        	LocalDateTime nextDay = endDate.plusDays(1).atStartOfDay();
	        	LocalDateTime now = LocalDateTime.now();
	        	if(now.isAfter(nextDay)) {
	        		eventService.pickRandomWinners();
	        		 log.debug(TeamColor.JSM + "이벤트 이름", event.getEventTitle());
	        	}
	        }
		} 
	}	
}	