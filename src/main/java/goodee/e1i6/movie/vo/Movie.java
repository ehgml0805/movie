package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Movie {
	private int movieKey;
	private String movieTitle;
	private String movieInfo;
	private String director;
	private String actor;
	private String grade;
	private String category;
	private String openingdate;
	private int runningtime;
	private String createdate;
	private String active;
}
