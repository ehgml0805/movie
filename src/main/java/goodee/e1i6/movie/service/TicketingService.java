package goodee.e1i6.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.TicketingMapper;
import goodee.e1i6.movie.vo.Ticketing;
import goodee.e1i6.movie.vo.TicketingSeat;

@Transactional
@Service
public class TicketingService {
	@Autowired TicketingMapper ticketingMapper;
	
	// 예매 수정
	public int modifyTicketing(Ticketing ticekting){
		return ticketingMapper.updateTicketing(ticekting);
	};
	
	// 예매 추가
	public int addTicketing(Ticketing ticekting){
		return ticketingMapper.insertTicketing(ticekting);
	};
	
	public int addTicketingSeat(TicketingSeat ticektingSeat){
		return ticketingMapper.insertTicketingSeat(ticektingSeat);
	};
	
	// 예매 내역 목록
	public List<Map<String, Object>> getTicketingList(String customerId){
		return ticketingMapper.selectTicketingList(customerId);
	};
}
