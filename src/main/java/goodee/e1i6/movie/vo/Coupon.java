package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Coupon {
	private int couponKey;
	private String couponName;
	private String couponSalePrice;
	private String couponGrade;
	private String useByDate;
	private String createdate;
}
