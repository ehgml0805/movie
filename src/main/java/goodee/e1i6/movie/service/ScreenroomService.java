package goodee.e1i6.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.ScreenroomMapper;
import goodee.e1i6.movie.vo.Screenroom;

@Transactional
@Service
public class ScreenroomService {
	@Autowired ScreenroomMapper screenroomMapper;
	
	// 상영관 목록(이름순)
	public List<Screenroom> getScreenroomList(int theaterKey) {
		return screenroomMapper.selectScreenroomList(theaterKey);
	}
	
	// 상영관 상세
	public Map<String, Object> getScreenroomOne(int screenroomKey) {
		return screenroomMapper.selectScreenroomOne(screenroomKey);
	}
	
	// 상영관 삭제
	public int removeScreenroom(int screenroomKey) {
		int row = screenroomMapper.selectCheckedTheaterForDelete(screenroomKey); // 0 삭제 가능
		
		if (row != 0) {
			return -1; // 좌석과 상영 스케줄을 삭제해주세요.
		}
		
		return screenroomMapper.deleteScreenroom(screenroomKey);
	}
	
	// 상영관 수정
	public int modifyScreenroom(Screenroom screenroom) {
		return screenroomMapper.updateScreenroom(screenroom);
	}
	
	// 상영관 등록
	public int addScreenroom(Screenroom screenroom) { 
		return screenroomMapper.insertScreenroom(screenroom);
	}
}
