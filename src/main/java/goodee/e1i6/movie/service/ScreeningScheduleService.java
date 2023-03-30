package goodee.e1i6.movie.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	// 빠른 예매 시 상영 스케줄 키 값 받아오기
	public Map<String, Object> getScreeningScheduleOneByTicketing(int movieKey, String time) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("movieKey", movieKey);
		paramMap.put("time", time);
		
		return screeningScheduleMapper.selectScreeningScheduleOneByTicketing(paramMap);
	}
	
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
		log.debug(TeamColor.JYW+"screeningSchedule : "+screeningSchedule);
		
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
	
	// 영화 예매 시 상영 스케줄 목록
	public ArrayList<Map<String, Object>> getScreeningScheduleListByDate(int movieKey, int theaterKey, String date){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("movieKey", movieKey);
		paramMap.put("theaterKey", theaterKey);
		paramMap.put("date", date);
		
		return screeningScheduleMapper.selectScreeningScheduleListByDate(paramMap);
	}
	
	// 상영 스케줄 목록
	public ArrayList<Map<String, Object>> getScreeningScheduleList(int movieKey, int theaterKey, String date){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("movieKey", movieKey);
		paramMap.put("theaterKey", theaterKey);
		paramMap.put("date", date);
		
		return screeningScheduleMapper.selectScreeningScheduleList(paramMap);
	}
}
