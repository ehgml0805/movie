package goodee.e1i6.movie.vo;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Customer {
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
}
