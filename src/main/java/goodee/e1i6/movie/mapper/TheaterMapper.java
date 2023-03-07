package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Theater;

@Mapper
public interface TheaterMapper {
	int deleteTheater(int theaterKey);
	int updateTheater(Theater theater);
	int insertTheater(String theaterName);
	Theater selectTheaterOne(int theaterKey);
	List<Theater> selectTheaterList(Map<String, Object> paramMap);
}
