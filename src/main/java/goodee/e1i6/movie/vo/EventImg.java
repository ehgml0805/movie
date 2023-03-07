package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class EventImg {
	private int eventKey;
	private String fileName;
	private String fileType;
	private long fileSize;
	private String originName;
	private String createdate;
}
