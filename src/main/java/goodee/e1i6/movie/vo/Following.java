package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Following {
	private int followingKey;
	private String customerId;
	private String toCustomer;
	private String createdate;
}
