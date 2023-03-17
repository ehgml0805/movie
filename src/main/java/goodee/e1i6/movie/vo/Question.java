package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Question {
	private int questionKey;
	private String questionTitle;
	private String customerId;
	private int questionCategoryKey;
	private int theaterKey;
	private String questionContent;
	private String createdate;

}
