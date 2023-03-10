package goodee.e1i6.movie.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SnackImg {
	private int snackKey;
	private String fileName;
	private String fileType;
	private long fileSize;
	private String originName;
	private String createdate;
	private MultipartFile mt;
}
