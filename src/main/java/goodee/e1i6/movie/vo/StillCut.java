package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class StillCut {
	private int stillCutKey;
	private int movieKey;
	private String poster;
	private String originName;
	private String fileName;
	private String fileType;
	private String fileSize;
	private String createdate;
}
