package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class CustomerImg {
	private String fileName;
	private String fileType;
	private long fileSize;
	private String originName;
	private String createdate;
	private String customerId;
}
