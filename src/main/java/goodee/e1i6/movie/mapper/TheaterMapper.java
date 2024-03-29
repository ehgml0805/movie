package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Theater;

@Mapper
public interface TheaterMapper {
	int selectCheckedTheaterForDelete(int theaterKey);
	int deleteTheater(int theaterKey);
	int updateTheater(Theater theater);
	int insertTheater(Theater theater);
	int selectTheaterOneByName(String theaterName);
	Theater selectTheaterOne(int theaterKey);
	List<Theater> selectTheaterList();
	List<Map<String, Object>> selectTheaterRegionList();
	List<Theater> selectTheaterNameListByRegion(Map<String, Object> paramMap);
	List<Map<String, Object>> selectRegionListByMovie(Map<String, Object> paramMap);
	// List<Map<String, Object>> selectRegionListBySchedule(Map<String, Object> paramMap);
}