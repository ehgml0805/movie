package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Visitor;

@Mapper
public interface VisitorMapper {
	// 일일 방문자 수정
	int updateVisitor(Visitor visitor);
	// 일일 첫번째 방문자 추가
	int insertVisitor(Visitor visitor);
	// 오늘 총 방문자 수
	int todayVisitorCount();
}
