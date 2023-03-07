package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Movie {
	private int movieKey;
	private String movieTitle;
	private String movieInfo; // 영화 정보(감독,배우,장르,러닝타임...)
	private String movieSummary; // 영화 줄거리
	private String grade; // 등급
	private String reservationRate; // 예매율
	private String openingdate;
	private String active; // Y or N
	private String createdate;
}
