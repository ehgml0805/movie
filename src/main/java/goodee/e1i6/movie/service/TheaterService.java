package goodee.e1i6.movie.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.TheaterMapper;
import goodee.e1i6.movie.vo.Postcode;
import goodee.e1i6.movie.vo.Theater;

@Transactional
@Service
public class TheaterService {
	@Autowired TheaterMapper theaterMapper;
	
	// 빠른 예매 - 영화 선택 시 해당 지역 및 상영중인 극장 수 출력
	public List<Map<String, Object>> getRegionListByMovie(int movieKey, String startDate) {
		if(startDate.equals("")) {
			 // 오늘 날짜 가져오기
	        LocalDate today = LocalDate.now();
	        
	        // 출력 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	        
	        // 형식에 맞게 출력
	        startDate = today.format(formatter);
		}
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("movieKey", movieKey);
		paramMap.put("startDate", startDate);
		
		return theaterMapper.selectRegionListByMovie(paramMap);
	}
	
	// 빠른 예매(해당 지역의 극장 목록)
	public List<Theater> geTheaterNameListByRegion(String theaterRegion) {
		return theaterMapper.selectTheaterNameListByRegion(theaterRegion);
	}
	
	// 빠른 예매(지역순)
	public List<Map<String, Object>> getTheaterRegionList() {
		return theaterMapper.selectTheaterRegionList();
	}
	
	// 극장 출력(이름순)
	public List<Theater> getTheaterList() {
		return theaterMapper.selectTheaterList();
	}
	
	// 극장 상세 정보
	public Theater getTheaterOne(int theaterKey) {
		return theaterMapper.selectTheaterOne(theaterKey);
	}
	
	// 극장 등록
	public int addTheater(Theater theater, Postcode postcode) {
		String address = 
				postcode.getPostcode() + 
				postcode.getRoadAddress() +
				postcode.getJibunAddress() +
				postcode.getDetailAddress() +
				postcode.getExtraAddress();
		
		theater.setTheaterAddress(address);
		
		return theaterMapper.insertTheater(theater);
	}
	
	// 극장 수정
	public int modifyTheater(Theater theater, Postcode postcode) {
		String address = 
				postcode.getPostcode() + 
				postcode.getRoadAddress() +
				postcode.getJibunAddress() +
				postcode.getDetailAddress() +
				postcode.getExtraAddress();
		
		theater.setTheaterAddress(address);
		
		return theaterMapper.updateTheater(theater);
	}
	
	// 극장 삭제
	public int removeTheater(int theaterKey) {
		int row = theaterMapper.selectCheckedTheaterForDelete(theaterKey); // 0 삭제 가능
		
		if(row != 0) {
			return -1; // 상영관과 문의사항을 삭제해주세요.
		}
		
		return theaterMapper.deleteTheater(theaterKey);
	}
}
