package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Snack {
	private int snackKey;
	private String snackName;
	private int snackPrice;
	private int snackCategoryKey;
	private String snackContent;
	private int snackSales;
	private String soldOut;
	private String createdate;
}
