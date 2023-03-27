package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Ticketing {
	private int ticketingKey;
	private int scheduleKey;
	private String customerId;
	private int mycouponKey;
	private int totalPrice;
	private int discountPrice;
	private String ticketingStatus;
	private String createdate;
}
