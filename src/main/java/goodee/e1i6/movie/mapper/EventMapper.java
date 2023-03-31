package goodee.e1i6.movie.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Event;
import goodee.e1i6.movie.vo.EventWinner;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.ScreeningSchedule;

@Mapper
public interface EventMapper {
	// eventWinner
	int insertEventWinner (EventWinner eventWinner);
	List<EventWinner> selectEventWinnerList(Map<String, Object>paraMap);
	// eventSchedule
	List<ScreeningSchedule> selectEventScheduleList(Map<String, Object>paraMap);
	// eventMovie
	List<Movie> selectEventMovieList(Map<String, Object>paraMap);
	// event
	List<Event> selectPastEvents();
	List<Event> eventOne (Map<String, Object>paraMap);
	int endEventCount(String searchWord);
	int eventCount(String searchWord);
	int updateEvent(Event event);
	int insertEvent(Event event);
	List<Event> selectEndEventList(Map<String, Object>paraMap);
	List<Event> selectEventList(Map<String, Object>paraMap);
	
	//내가 참여한 이벤트 목록 조회 
	List<Map<String, Object>> selectEventListById(String customerId);
}
