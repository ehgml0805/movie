package goodee.e1i6.movie.mapper;


import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Event;

@Mapper
public interface EventMapper {
	int insertEvent(Event event);
}
