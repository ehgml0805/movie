package goodee.e1i6.movie.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Movie;

@Mapper
public interface MovieMapper {
	//  빠른 예매 - 날짜에 따른 영화 전체 목록
	List<Map<String, Object>> selectMovieListByDate(String startDate);
	
	// 영화 삭제
	int deleteMovie(int movieKey);
	
	// 영화 수정
	int updateMovie(Movie movie);
	
	// 영화 상세정보
	ArrayList<Map<String, Object>> selectMovieOne(int movieKey);
	
	// 영화 목록
	ArrayList<Map<String, Object>> selectMovieList(String startDate);
	
	// 영화 등록
	int insertMovie(Movie movie);
	
	// 영화 크롤링을 통한 등록
	int insertMovieByCrawling(Movie movie);
	
	// 영화 중복 검사
	int selectMovieCk(int movieKey);
	
}
