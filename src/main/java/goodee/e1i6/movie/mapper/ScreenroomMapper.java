package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Screenroom;

@Mapper
public interface ScreenroomMapper {
	int deleteScreenroom(int screenroomKey);
	int updateScreenroom(Screenroom screenroom);
	int insertScreenroom(String screenroomName);
	Screenroom selectScreenroomOne(int screenroomKey);
	List<Screenroom> selectScreenroomList(Map<String, Object> paramMap);
}
