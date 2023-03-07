package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Cart {
	
	private String customerId;
	private int snackKey;
	private int cartQuantity;
	private String createdate;
}
