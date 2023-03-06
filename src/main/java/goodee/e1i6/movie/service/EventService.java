package goodee.e1i6.movie.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.EventMapper;
import goodee.e1i6.movie.vo.Event;

@Service
@Transactional
public class EventService {
	@Autowired
	private EventMapper eventMapper;
	
	// EventAdd
	public int addEvent(Event event) {
		return eventMapper.insertEvent(event);
	}
}
