package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Ticketing;
import goodee.e1i6.movie.vo.TicketingSeat;

@Mapper
public interface TicketingMapper {
	
	// 예매 수정
	int updateTicketing(Ticketing ticekting);
	
	// 예매 추가
	int insertTicketing(Ticketing ticekting);
	
	int insertTicketingSeat(TicketingSeat ticektingSeat);
	
	// 예매 상세정보
	Map<String, Object> selectTicketingOne();
	
	// 예매 내역 목록
	List<Map<String, Object>> selectTicketingList(String customerId);
}
