package goodee.e1i6.movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Theater;

@Mapper
public interface TheaterMapper {
	int selectCheckedTheaterForDelete(int theaterKey);
	int deleteTheater(int theaterKey);
	int updateTheater(Theater theater);
	int insertTheater(Theater theater);
	Theater selectTheaterOne(int theaterKey);
	List<Theater> selectTheaterList();
	List<Theater> selectTheaterRegionList();
	List<Theater> selectTheaterNameListByRegion(String theaterRegion);
}