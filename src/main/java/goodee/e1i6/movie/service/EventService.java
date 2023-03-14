package goodee.e1i6.movie.service;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.mapper.EventCommentMapper;
import goodee.e1i6.movie.mapper.EventImgMapper;
import goodee.e1i6.movie.mapper.EventMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Event;
import goodee.e1i6.movie.vo.EventComment;
import goodee.e1i6.movie.vo.EventForm;
import goodee.e1i6.movie.vo.EventImg;
import goodee.e1i6.movie.vo.EventWinner;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.ScreeningSchedule;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EventService {
	@Autowired private EventMapper eventMapper;
	@Autowired private EventImgMapper eventImgMapper;
	@Autowired private EventCommentMapper eventCommentMapper; 
		
	// eventWinner
	public int addEventWinner(EventWinner eventWinner) {
		return eventMapper.insertEventWinner(eventWinner);
	}
	
	// eventWinnerList
	public List<EventWinner> getEventWinnerList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return eventMapper.selectEventWinnerList(paramMap);
	}
	
	// eventSchedule
	public List<ScreeningSchedule> getEventScheduleList() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return eventMapper.selectEventScheduleList(paramMap);
	}
	
	// eventMovie
	public List<Movie> getEventMovieList() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return eventMapper.selectEventMovieList(paramMap);
	}
	
	// EventCommentCount
	public int eventCommentCount(int eventKey) {
		return eventCommentMapper.eventCommentCount(eventKey);
	}
	// removeComment
	public int removeComment(int eventCommentKey) {
		return eventCommentMapper.deleteEventComment(eventCommentKey);
	}
	
	// modifyComment
	public int modifyEventComment(EventComment eventComment) {
		return eventCommentMapper.updateEventComment(eventComment);
	}
	
	// addEventComment
	public int addEventComment(EventComment eventComment) {
		return eventCommentMapper.insertEventComment(eventComment);
	}
	
	// EventCommentList
	public List<EventComment> getEventCommentList(int currentPage, int rowPerPage, int eventKey){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("eventKey", eventKey);
		
		return eventCommentMapper.selectEventCommentList(paramMap);
	} 
	
	// 이벤트 종료일이 지난 이벤트 리스트 가져오기
	public void pickRandomWinners() {
		List<Event> pastEvents = eventMapper.selectPastEvents(); 
        	for (Event event : pastEvents) {
        		int eventCommentCount = eventCommentMapper.eventCommentCount(event.getEventKey());
    			if (eventCommentCount > 0) {
    				// 이벤트에 대한 댓글 리스트 가져오기
    				Map<String, Object> paramMap = new HashMap<>();
    				paramMap.put("eventKey", event.getEventKey());
    				log.debug(TeamColor.JSM + "eventKey " + event.getEventKey());
    				List<EventComment> commentList = eventCommentMapper.selectEventWinnerCommentList(paramMap);

    	            // 중복된 아이디 제외한 리스트 만들기
    	            Set<String> customerIdSet = new HashSet<>();
    	            List<EventComment> uniqueCommentList = new ArrayList<>();
    	            for (EventComment comment : commentList) {
    	                if (!customerIdSet.contains(comment.getCustomerId())) {
    	                    customerIdSet.add(comment.getCustomerId());
    	                    uniqueCommentList.add(comment);
    	                }
    	            }

    	            // uniqueCommentList에서 랜덤하게 당첨자 선정
    	            List<EventComment> winners = new ArrayList<>();
    	            int winnerCount = Math.min(5, uniqueCommentList.size());
    	            for (int i = 0; i < winnerCount; i++) {
    	                int randomIndex = new Random().nextInt(uniqueCommentList.size());
    	                EventComment winnerComment = uniqueCommentList.remove(randomIndex);
    	                winners.add(winnerComment);
    	                log.debug(TeamColor.JSM + "Winner added :" + winnerComment.getEventCommentKey());    
    	            }
    	            log.debug(TeamColor.JSM + "Winners size: " + winners.size());  
	              
    	            // 이벤트위너 테이블에 추가
		            for (EventComment winnerComment : winners) {
		                EventWinner eventWinner = new EventWinner();
		                eventWinner.setEventCommentKey(winnerComment.getEventCommentKey());
		                eventWinner.setScheduleKey(winnerComment.getScheduleKey());
		                eventMapper.insertEventWinner(eventWinner);
		            }
	        
    			}
	   
        	}
	}	

	
	// EventOne
	public List<Event> getEventOne (Event event){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("eventKey", event.getEventKey());
		return eventMapper.eventOne(paramMap);
	}
	
	// EventCount
	public int eventCount(String searchWord, int currentPage, int rowPerPage) {
		int count = eventMapper.eventCount(searchWord);
		int lastPage =  (count + rowPerPage - 1) / rowPerPage;
	
		return lastPage;
	}
	
	
	// EventAdd
	public void addEvent(EventForm eventForm, String path) {
		Event event = new Event();
		event.setEventTitle(eventForm.getEventTitle());
		event.setEventContent(eventForm.getEventContent());
		event.setEventStartDate(eventForm.getEventStartDate());;
		event.setEventEndDate(eventForm.getEventEndDate());
		event.setMovieKey(eventForm.getMovieKey());
		
		int row = eventMapper.insertEvent(event);
		log.debug(TeamColor.JSM + row + " <- eventMapper.insertEvent 실행결과 :");
		
		if(eventForm.getEventImgList().get(0).getSize() > 0 && row == 1) {
			for(MultipartFile mf : eventForm.getEventImgList()) {
				EventImg eventImg = new EventImg();
				
				String originName = mf.getOriginalFilename();
				// originName에서 마지막 .문자열 위치
				String ext = originName.substring(originName.lastIndexOf("."));
				
				// 파일을 저장할때 사용할 중복되지않는 새로운 이름 필요(UUID API사용)
				String fileName = UUID.randomUUID().toString();
			
				fileName = fileName + ext;
				
				eventImg.setEventKey(event.getEventKey());
				eventImg.setFileName(fileName);
				eventImg.setFileType(mf.getContentType());
				eventImg.setFileSize(mf.getSize());
				eventImg.setOriginName(originName);
				eventImgMapper.insertEventImg(eventImg);		
				try {
					mf.transferTo(new File(path+fileName));
				} catch (Exception e) {
					e.printStackTrace();
					// 파일업로드에 실패하면
					// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
					// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
					throw new RuntimeException();
				}
			}
		}
	}
	
	// EventList
	public List<Event> getEventList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return eventMapper.selectEventList(paramMap);
	}
}
