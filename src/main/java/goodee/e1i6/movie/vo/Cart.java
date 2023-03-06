package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Cart {
	private int cartKey;
	private String customerId;
	private int snackKey;
	private int count;
	private String createdate;
}
