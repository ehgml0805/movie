package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Seat {
	private int seatKey;
	private int screenroomKey;
	private String seatNumber;
	private String active;
	private String useable;
}
