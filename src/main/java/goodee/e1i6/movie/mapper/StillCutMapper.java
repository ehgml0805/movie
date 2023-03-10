package goodee.e1i6.movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.StillCut;

@Mapper
public interface StillCutMapper {
	
	// 영화 이미지 삭제
	int deleteStillCut(int stillCutKey);
	
	// 영화 이미지 수정
	int updateStillCut(StillCut stillCut);
	
	// 영화 이미지 등록
	int insertStillCut(StillCut stillCut);
	
	// 크롤링을 통한 영화 이미지 등록
	int insertStillCutByCrawling(StillCut stillCut);
	
	// 영화 이미지 상세정보 출력
	StillCut selectStillCutOne(int stillCutKey);
	
	// 영화에 맞는 영화 이미지 목록 출력
	int[] selectStillCut(int movieKey);
	
	// 영화 이미지 출력
	List<StillCut> selectStillCutList(int movieKey);
}
