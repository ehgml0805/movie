package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Review {
	private int ticketingKey;
	private String customerId;
	private int ratings;
	private String content;
	private int love;
	private int insultReport;
	private int spoilerReport;
	private String createdate;
}
