package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Blacklist {
	private int blacklistKey;
	private String customerId;
	private int reportCategoryKey;
	private String startdate;
	private String enddate;
}
