package goodee.e1i6.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.VisitorMapper;
import goodee.e1i6.movie.vo.Visitor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class VisitorService {
	@Autowired private VisitorMapper visitorMapper;
	// 월별 방문자 수 
    public List<Map<String, Object>> getMonthlyVisitorCount(int year) {
        return visitorMapper.selectMonthVisitorCount(year);
    }
	
	// 오늘 첫 방문자가 아닐 경우 update
	public int modifyVisitor(Visitor visitor) {
		return visitorMapper.updateVisitor(visitor);
	}
	
	// 오늘 첫 방문자
	public int addVisitor(Visitor visitor) {
		return visitorMapper.insertVisitor(visitor);
	}
	// 오늘 총 방문자 수
    public int getTodayVisitorCount() {
        return visitorMapper.todayVisitorCount();
    }
}
