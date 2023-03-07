package goodee.e1i6.movie.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventForm {
	private String eventTitle;
	private String eventContent;
	private String eventStartDate;
	private String eventEndDate;
	private List<MultipartFile> eventImgList;
}
