package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import goodee.e1i6.movie.mapper.GradeMapper;
import goodee.e1i6.movie.vo.Customer;

@Component
public class GradeService {
	@Autowired private GradeMapper gradeMapper;
	
	// 고객 등급 상태 변경
	public int updateVip() {
		return gradeMapper.updateVip();
	}
	// 고객 등급 상태 변경
	public int updateGold() {
		return gradeMapper.updateGold();
	}
	// 고객 등급 상태 변경
	public int updateSilver() {
		return gradeMapper.updateSilver();
	}

}
