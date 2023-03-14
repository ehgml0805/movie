package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Screenroom {
	private int screenroomKey;
	private int theaterKey;
	private String screenroomName;
	private int seatCount;
	private String createdate;
}
