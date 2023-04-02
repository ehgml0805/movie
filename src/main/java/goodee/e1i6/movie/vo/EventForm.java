package goodee.e1i6.movie.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventForm {
	private int eventKey;
	private String eventTitle;
	private String eventContent;
	private String eventStartDate; 
	private String eventEndDate;
	private int movieKey;
	private List<MultipartFile> eventImgList;
}
