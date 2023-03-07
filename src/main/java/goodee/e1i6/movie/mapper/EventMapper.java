package goodee.e1i6.movie.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Event;

@Mapper
public interface EventMapper {
	// event
	int eventCount(String searchWord);
	int insertEvent(Event event);
	List<Event> selectEventList(Map<String, Object>paraMap);
}
