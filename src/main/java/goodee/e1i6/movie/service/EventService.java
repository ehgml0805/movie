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
import org.springframework.mail.javamail.JavaMailSender;
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
	@Autowired private EmailService emailService;
	@Autowired private JavaMailSender javaMailSender;
	
	// 내가 참여한 이벤트 리스트 
	public List<Map<String, Object>> selectEventListById(String customerId){
		return eventMapper.selectEventListById(customerId);
	}
	
	//스포일러 신고 업데이트
	public int spoilerReport(int eventCommentKey, String customerId) {
		return eventCommentMapper.spoilerReport(eventCommentKey, customerId);
	}
	
	//욕설, 비방 신고 업데이트
	public int insultReport(int eventCommentKey, String customerId) {
		return eventCommentMapper.insultReport(eventCommentKey, customerId);
	}

	
	// eventWinner
	public int addEventWinner(EventWinner eventWinner) {
		return eventMapper.insertEventWinner(eventWinner);
	}
	
	// eventWinnerList
	public List<EventWinner> getEventWinnerList(int eventKey) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("eventKey", eventKey);
		return eventMapper.selectEventWinnerList(paramMap);
	}
	
	// eventSchedule
	public List<ScreeningSchedule> getEventScheduleList(int movieKey) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("movieKey", movieKey);
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
	public int removeComment(EventComment eventComment) {
		return eventCommentMapper.deleteEventComment(eventComment);
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
    				 List<Map<String, Object>> commentList = eventCommentMapper.selectEventWinnerCommentList(paramMap);
    				
    				log.debug(TeamColor.JSM + "commentList " + commentList);
    	           
    				// 중복된 아이디 제외한 리스트 만들기
    	            Set<String> customerIdSet = new HashSet<>();
    	            List<Map<String, Object>> uniqueCommentList = new ArrayList<>();
    	            for (Map<String, Object> comment: commentList) {
    	                if (!customerIdSet.contains(comment.get("customerId"))) {
    	                    customerIdSet.add((String) comment.get("customerId"));
    	                    uniqueCommentList.add(comment);
    	                }
    	            }

    	            // uniqueCommentList에서 랜덤하게 당첨자 선정
    	            List<Map<String, Object>> winners = new ArrayList<>();
    	            int winnerCount = Math.min(1, uniqueCommentList.size());
    	            Random random = new Random(); 
    	            for (int i = 0; i < winnerCount; i++) {
    	                int randomIndex = random.nextInt(uniqueCommentList.size()); 
    	                Map<String, Object> winnerComment = uniqueCommentList.remove(randomIndex);
    	                winners.add(winnerComment);
    	                log.debug(TeamColor.JSM + "Winner added :" + winnerComment.get("eventCommentKey"));
    	            }
    	     
    	            log.debug(TeamColor.JSM + "Winners size: " + winners.size());
    	            // 이벤트위너 테이블에 추가
    	            for (Map<String, Object> winnerComment: winners) {
		                EventWinner eventWinner = new EventWinner();
		                eventWinner.setEventKey(event.getEventKey()); 
		                eventWinner.setEventCommentKey((int) winnerComment.get("eventCommentKey"));
		                eventWinner.setScheduleKey((int) winnerComment.get("scheduleKey"));
		                eventMapper.insertEventWinner(eventWinner);
		                
    	                log.debug(TeamColor.JSM + "winnerComment :" + winnerComment.get("customerEmail"));

		                
		                String recipientAddress = (String) winnerComment.get("customerEmail");
		                emailService.sendEmail(recipientAddress);
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
	public int endEventCount(String searchWord, int currentPage, int rowPerPage) {
		int count = eventMapper.endEventCount(searchWord);
		int lastPage =  (count + rowPerPage - 1) / rowPerPage;
	
		return lastPage;
	}
	
	// EventCount
	public int eventCount(String searchWord, int currentPage, int rowPerPage) {
		int count = eventMapper.eventCount(searchWord);
		int lastPage =  (count + rowPerPage - 1) / rowPerPage;
	
		return lastPage;
	}
	
	// modifyEvent
	public void modifyEvent(EventForm eventForm, String path) {
		Event event = new Event();
		event.setEventKey(eventForm.getEventKey());
		event.setEventTitle(eventForm.getEventTitle());
		event.setEventContent(eventForm.getEventContent());
		event.setEventStartDate(eventForm.getEventStartDate());;
		event.setEventEndDate(eventForm.getEventEndDate());
		event.setMovieKey(eventForm.getMovieKey());
		
		int row = eventMapper.updateEvent(event);
		log.debug(TeamColor.JSM + row + " <- eventMapper.updateEvent 실행결과");
		
		if(eventForm.getEventImgList().get(0).getSize() > 0 && row == 1) {
			eventImgMapper.deleteEventImg(eventForm.getEventKey());
			for(MultipartFile mf : eventForm.getEventImgList()) {
				EventImg eventImg = new EventImg();
				
				String originName = mf.getOriginalFilename();
				// originName에서 마지막 .문자열 위치
				String ext = originName.substring(originName.lastIndexOf("."));
				
				// 파일을 저장할때 사용할 중복되지않는 새로운 이름 필요(UUID API사용)
				String fileName = UUID.randomUUID().toString();
			
				fileName = fileName + ext;
				
				eventImg.setEventKey(eventForm.getEventKey());
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
	
	// EndEventList
	public List<Event> getEndEventList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return eventMapper.selectEndEventList(paramMap);
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
