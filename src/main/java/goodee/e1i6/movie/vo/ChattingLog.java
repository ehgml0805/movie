package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class ChattingLog {
	private int chattingKey;
	private String customerId;
	private String employeeId;
	private String chattingContent;
	private String createdate;
}
