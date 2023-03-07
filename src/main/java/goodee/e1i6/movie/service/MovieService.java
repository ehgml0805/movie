package goodee.e1i6.movie.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.MovieMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.StillCut;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MovieService {
	@Autowired MovieMapper movieMapper; 
	
	// 영화 목록 출력
	public ArrayList<Map<String, Object>> getMovieList() {
		return movieMapper.selectMovieList();
	}
	
	// 영화 크롤링 DB 저장
	public void addMovie() {
		String url = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
        Document doc = null;    
        
        // 영화 코드 가져와서 링크에 연결
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        
        // 영화 상세 링크
        Elements elements = doc.select(".sect-movie-chart");
        ArrayList<String> movieDetailLink = new ArrayList<>();
        
        for(Element element: elements.select(".box-image a:not(span.screentype a)")) {
        	movieDetailLink.add("http://www.cgv.co.kr" + element.attr("href"));
        }
        // log.debug(TeamColor.CHOI + "영화상세링크 : " + movieDetailLink);
        
        // DB에 저장할 영화 상세 정보
        int row = 0;
        for(int i = 0; i < movieDetailLink.size(); i++) {        	
        	url = movieDetailLink.get(i); // http://www.cgv.co.kr/movies/detail-view/?midx=86815
        	
        	try {
        		doc = Jsoup.connect(url).get();
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
        	
        	String[] reservationRate_ = doc.select(".percent span").text().split("%"); 
        	// log.debug(TeamColor.CHOI + reservationRate_[0]);
        	
        	String[] movieInfo_ = doc.select(".spec").first().text().split("개봉 : "); 
        	// log.debug(TeamColor.CHOI + movieInfo_[1].trim()); // 기본 : 12, 122분, 일본 개봉 : 2023.03.08 
        	String[] movieKey_ = url.split("=");
        	
        	int movieKey = Integer.parseInt(movieKey_[1]);
        	String movieTitle = doc.select(".box-contents .title strong").text();
        	String movieInfo = doc.select(".spec").first().text(); 
        	String movieSummary = doc.select(".sect-story-movie").text();
        	String grade = doc.select(".thumb-image i").first().text(); // 18, 15, 12, ALL
        	String reservationRate = reservationRate_[0]; // 00.0
        	String openingdate = movieInfo_[1].trim(); // yyyy.mm.dd
        	String movieImageLink = doc.select(".thumb-image img").attr("src"); // 이미지 링크
        	Elements movieStillCutLink_ = doc.select(".slider img");
        	// log.debug(TeamColor.CHOI + movieTitle + movieImage + movieInfo + movieSummary + grade + reservationRate + openingdate);
        	
        	// Movie VO
        	Movie movie = new Movie();
        	movie.setMovieKey(movieKey);
        	movie.setMovieTitle(movieTitle);
        	movie.setMovieInfo(movieInfo);
        	movie.setMovieSummary(movieSummary);
        	movie.setGrade(grade);
        	movie.setReservationRate(reservationRate);
        	movie.setOpeningdate(openingdate);
        	
        	// StillCut VO
        	StillCut stillCut = new StillCut();
        	stillCut.setMovieKey(movieKey);
        	stillCut.setOriginName(movieImageLink);
        	stillCut.setFileName(movieImageLink);
        	stillCut.setPoster("Y");
        	stillCut.setFileType("");
        	stillCut.setFileSize("");
        	
        	ArrayList<StillCut> stillCutList = new ArrayList<>();
        	for(Element element : movieStillCutLink_) {
        		log.debug(TeamColor.CHOI + "스틸컷링크 : " + element.attr("data-src"));
        		StillCut stillCuts = new StillCut();
            	stillCuts.setMovieKey(movieKey);
            	stillCuts.setOriginName(element.attr("data-src"));
            	stillCuts.setFileName(element.attr("data-src"));
            	stillCut.setPoster("N");
            	stillCuts.setFileType("");
            	stillCuts.setFileSize("");
            	stillCutList.add(stillCuts);
        	}
        	
        	// 크롤링 영화 데이터와 DB데이터 중복 검사
        	row = movieMapper.selectMovieCk(movieKey); // 1 중복 OR 0 중복아님
        	if(row != 1) { // 중복이 아니면 영화 등록
        		row = movieMapper.insertMovie(movie); // 1 성공 OR 0 실패
        		if(row != 0) {
        			movieMapper.insertStillCut(stillCut); // 포스터 1장, 1 성공 OR 0 실패      
        			for(StillCut s : stillCutList) {
        				movieMapper.insertStillCut(s); // 스틸컷 여러장, 1 성공 OR 0 실패      
        			}
        		}
        	}        	
        }
	}
	
}
