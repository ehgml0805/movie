package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Cart {
	
	private String customerId;
	private int snackKey;
	private int cartQuantity;
	private String createdate;
	private String snackName;
	private String fileName;
	private String fileType;
	private int snackPrice;
	private String soldOut;
	private int select;
	private int orderKey;
}
