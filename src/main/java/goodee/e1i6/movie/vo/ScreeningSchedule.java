package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class ScreeningSchedule {
	private int scheduleKey;
	private int movieKey;
	private int screenroomKey;
	private String startDate;
	private String endDate;
	private String preview;
	private int price;
}
