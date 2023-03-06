package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class TotalOrder {
	private String createdate;
	private int totalPrice;
	private String customerId;
	private int mycouponKey;
}
