package goodee.e1i6.movie.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.ScreeningSchedule;

@Mapper
public interface ScreeningScheduleMapper {
	
	// 상영 스케줄 삭제
	int deleteScreeningSchedule(int scheduleKey);
	
	// 상영 스케줄 수정
	int updateScreeningSchedule(ScreeningSchedule screeningSchedule);
	
	// 상영 스케줄 입력
	int insertScreeningSchedule(ScreeningSchedule screeningSchedule);
	
	// 상영 스케줄 한개
	Map<String, Object> selectScreeningScheduleOne(int scheduleKey);
	
	// 영화 예매 시 상영 스케줄 목록
	ArrayList<Map<String, Object>> selectScreeningScheduleListByDate(Map<String, Object> paramMap);
	
	// 상영 스케줄 목록
	ArrayList<Map<String, Object>> selectScreeningScheduleList(Map<String, Object> paramMap);
}
