package goodee.e1i6.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.PointMapper;
import goodee.e1i6.movie.vo.PointAccumulate;
import goodee.e1i6.movie.vo.PointRedeem;

@Service
@Transactional
public class PointService {
	@Autowired PointMapper pointMapper;
	
	//포인트 사용 
	public int insertPointRedeem(PointRedeem pointRedeem) {
		return pointMapper.insertPointRedeem(pointRedeem);
	};
	
	//포인트 적립 목록 
	public List<PointRedeem> pointRedeemList(int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage); //몇개씩 보여줄거
		return pointMapper.pointRedeemList(paramMap);
		
	}
	//포인트 사용 목록 
	public List<PointAccumulate> pointAccumulateList(int currentPage, int rowPerPage, String customerId){
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage); //몇개씩 보여줄거
		paramMap.put("customerId", customerId);
		return pointMapper.pointAccumulateList(paramMap);
		
	}
}
