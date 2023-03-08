package goodee.e1i6.movie.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Event;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.ScreeningSchedule;

@Mapper
public interface EventMapper {
	// eventSchedule
	List<ScreeningSchedule> selectEventScheduleList(Map<String, Object>paraMap);
	// eventMovie
	List<Movie> selectEventMovieList(Map<String, Object>paraMap);
	// event
	List<Event> eventOne (Map<String, Object>paraMap);
	int eventCount(String searchWord);
	int insertEvent(Event event);
	List<Event> selectEventList(Map<String, Object>paraMap);
}
