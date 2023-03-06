package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Event {
	private int eventKey;
	private String eventTitle;
	private String eventContent;
	private String eventStartDate;
	private String eventEndDate;
	private int movieKey;
}
