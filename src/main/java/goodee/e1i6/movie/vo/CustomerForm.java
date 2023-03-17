package goodee.e1i6.movie.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CustomerForm {
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerAddress;
	private String customerBirthday;
	private String customerGender;
	private String customerPhone;
	private int customerPoint;
	private String customerEmail;
	private String blacklist;
	private String customerGrade;
	private String lastLogin;
	private String createdate;
	private List<MultipartFile> customerImgList;
}
