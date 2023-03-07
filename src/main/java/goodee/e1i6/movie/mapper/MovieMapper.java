package goodee.e1i6.movie.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.StillCut;

@Mapper
public interface MovieMapper {
	// 영화 목록
	ArrayList<Map<String, Object>> selectMovieList();
	// 영화 등록
	int insertMovie(Movie movie);
	// 영화 중복 검사
	int selectMovieCk(int movieKey);
	// 영화 이미지 등록
	int insertStillCut(StillCut stillCut);
}
