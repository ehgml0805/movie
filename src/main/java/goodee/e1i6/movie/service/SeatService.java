package goodee.e1i6.movie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.ScreenroomMapper;
import goodee.e1i6.movie.mapper.SeatMapper;
import goodee.e1i6.movie.vo.Screenroom;
import goodee.e1i6.movie.vo.Seat;
import goodee.e1i6.movie.vo.SeatRest;

@Service
@Transactional
public class SeatService {
	@Autowired SeatMapper seatMapper;
	@Autowired ScreenroomMapper screenroomMapper;
	
	// (임시) 좌석 추가
	public int addSeat(int screenroomKey, int x, int y) {
		int row = 0;
		String[] xArr = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
		
		// ArrayList<Map<String, Object>> seatList2 = new ArrayList<>();
		List<Map<String, Object>> seatList = new ArrayList<>();

		// x축, y축
		for (int i = 0; i < x; i++) {
			for (int j = 1; j <= y; j++) {
				HashMap<String, Object> paramMap = new HashMap<>();
				paramMap.put("seatNumber", xArr[i] + j);
				paramMap.put("screenroomKey", screenroomKey);
				seatList.add(paramMap);
			}			
		}
		
		for(Map<String, Object> seat : seatList) {
			row = seatMapper.insertSeat(seat);
		}
		
		Screenroom screenroom = new Screenroom();
		screenroom.setScreenroomKey(screenroomKey);
		screenroom.setSeatCount(x*y);
		
		row = screenroomMapper.updateSeatCount(screenroom);
		
		return row;
	}
	
	// 좌석 목록 
	public List<Seat> getSeatListByScreenroom(int screenroomKey) {
		return seatMapper.selectSeatListByScreenroom(screenroomKey);
	}
	
	// 좌석 수정
	public int modifySeat(SeatRest seatRest) {
		int row = 0;
		
		int[] seatKeys = seatRest.getSeatKey();
        String[] useables = seatRest.getUseable();
        
        // 업데이트 처리
        for (int i = 0; i < seatKeys.length; i++) {
            int seatKey = seatKeys[i];
            String useable = useables[i];
            Seat seat = new Seat();
            seat.setSeatKey(seatKey);
            seat.setUseable(useable);
            
            row = seatMapper.updateSeat(seat);
        }
        
		return row;
	}
}
