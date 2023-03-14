package goodee.e1i6.movie.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.ScreeningScheduleMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.ScreeningSchedule;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ScreeningScheduleService {
	@Autowired ScreeningScheduleMapper screeningScheduleMapper;
	
	// 상영 스케줄 삭제
	public int removeScreeningSchedule(int scheduleKey) {
		return screeningScheduleMapper.deleteScreeningSchedule(scheduleKey);
	}
	
	// 상영 스케줄 수정
	public int modifyScreeningSchedule(ScreeningSchedule screeningSchedule) {
		return screeningScheduleMapper.updateScreeningSchedule(screeningSchedule);
	}
	
	// 상영 스케줄 입력
	public int addScreeningSchedule(ScreeningSchedule screeningSchedule) {
		String startDate = screeningSchedule.getStartDate();
		String[] startDate_ = startDate.split("T");
		startDate = startDate_[0]+" "+startDate_[1]+":00";
		screeningSchedule.setStartDate(startDate);
		log.debug(TeamColor.JYW+"startDate : "+startDate);
		
		String endDate = screeningSchedule.getEndDate();
		String[] endDate_ = endDate.split("T");
		endDate = endDate_[0]+" "+ endDate_[1]+":00";
		screeningSchedule.setEndDate(endDate);
		log.debug(TeamColor.JYW+"endDate : "+endDate);
		
		return screeningScheduleMapper.insertScreeningSchedule(screeningSchedule);
	}
	
	public Map<String, Object> getScreeningScheduleOne(int scheduleKey){
		return screeningScheduleMapper.selectScreeningScheduleOne(scheduleKey);
	}
	
	// 상영 스케줄 목록
	public ArrayList<Map<String, Object>> getScreeningScheduleList(int movieKey, int theaterKey){
		return screeningScheduleMapper.selectScreeningScheduleList(movieKey, theaterKey);
	}
}
