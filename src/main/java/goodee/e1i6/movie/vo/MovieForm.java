package goodee.e1i6.movie.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MovieForm {
	private int movieKey;
	private String movieTitle;
	private String movieInfo;
	private String movieSummary;
	private String grade;
	private String openingdate;
	private String active;
	
	private MultipartFile poster;
	private List<MultipartFile> stillCut;
	
	// 파일이 저장될 폴더위치(path)
	private String path;
}
