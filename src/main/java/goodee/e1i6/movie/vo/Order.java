package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Order {
	private int orderKey;
	private int snackKey;
	private String customerId;
	private int orderPrice;
	private String orderState;
	private String createdate;
	private int orderQuantity;
	private String dataKey;
	private String active;
}
