package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.StillCut;

@Mapper
public interface StillCutMapper {
	
	// 영화 이미지 삭제
	int deleteStillCut(int stillCutKey);
	
	// 영화 이미지 수정
	int updateStillCut(StillCut stillCut);
	
	// 영화 이미지 등록
	int insertStillCutByCrawling(StillCut stillCut);
	
	// 영화에 맞는 영화 이미지 목록 출력
	int[] selectStillCut(int movieKey);
}
