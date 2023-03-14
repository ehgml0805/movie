package goodee.e1i6.movie.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Snack {
	private int snackKey;
	private String snackName;
	private int snackPrice;
	private int snackCategoryKey;
	private String snackContent;
	private int snackSales;
	private String soldOut;
	private String createdate;
	private String fileName;
	private String fileType;
	private String categoryContent;
	private MultipartFile mf;
}
