package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Seat;

@Mapper
public interface SeatMapper {
	int deleteSeat(int seatKey);
	int updateSeat(Seat seat);
	int insertSeat(String seatName);
	Seat selectSeatOne(int seatKey);
	List<Seat> selectSeatList(Map<String, Object> paramMap);
}
