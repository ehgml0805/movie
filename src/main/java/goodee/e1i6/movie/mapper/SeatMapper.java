package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Seat;

@Mapper
public interface SeatMapper {
	int deleteSeat(int seatKey);
	int insertSeat(Map<String, Object> paramMap);
	Seat selectSeatOne(int seatKey);
	List<Seat> selectSeatListByScreenroom(int screenroomKey);
	int updateSeat(Seat seat);
	int updateSeatByTicketing(Seat seat);
}
