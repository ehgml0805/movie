package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class EventComment {
	private int eventCommentKey;
	private String eventCommentContent;
	private String createdate;
	private String customerId;
	private int scheduleKey;
	private int eventKey;
	private int insultReport;
	private int spoilerReport;
}
