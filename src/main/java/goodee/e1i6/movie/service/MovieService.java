package goodee.e1i6.movie.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.mapper.MovieMapper;
import goodee.e1i6.movie.mapper.StillCutMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Movie;
import goodee.e1i6.movie.vo.MovieForm;
import goodee.e1i6.movie.vo.StillCut;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MovieService {
	@Autowired MovieMapper movieMapper; 
	@Autowired StillCutMapper stillCutMapper; 
	
	// 빠른 예매 - 날짜에 따른 영화 전체 목록
	public List<Map<String, Object>> getMovieListByDate(String startDate) {
		if(startDate.equals("")) {
			 // 오늘 날짜 가져오기
	        LocalDate today = LocalDate.now();
	        
	        // 출력 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	        
	        // 형식에 맞게 출력
	        startDate = today.format(formatter);
		}
		
		return movieMapper.selectMovieListByDate(startDate);
	}
	
	// 영화 삭제
	public int removeMovie(int movieKey) {
		return movieMapper.deleteMovie(movieKey);
	}
	
	// 영화 수정
	public int modifyMovie(MovieForm movieForm, String path) {
		// 1+2+3+4 -> 트랜잭션 처리
		
		// movie 테이블(1) : (N) still_cut 테이블
		Movie movie = new Movie();
		movie.setMovieKey(movieForm.getMovieKey());
    	movie.setMovieTitle(movieForm.getMovieTitle());
    	movie.setMovieInfo(movieForm.getMovieInfo());
    	movie.setMovieSummary(movieForm.getMovieSummary());
    	movie.setGrade(movieForm.getGrade());
    	movie.setOpeningdate(movieForm.getOpeningdate());
    	movie.setActive(movieForm.getActive());
    	
    	int row = movieMapper.updateMovie(movie);
    	
    	// movieForm에 path값과 movieKey값 세팅
    	movieForm.setPath(path);
    	
    	// stillCut가 하나 이상일 떄
    	if(movieForm.getStillCut() != null) {
	    	if(movieForm.getStillCut().get(0).getSize() > 0 && row == 1) {
	    		log.debug(TeamColor.JYW + "MovieController.modifyMovie : " + "수정된 파일이 있습니다.");
	    		
	    		// 2. 파일 업로드
	    		MultipartFile poster = movieForm.getPoster();
	    		log.debug(TeamColor.JYW + poster.getOriginalFilename() + poster.getSize());
	    		
	    		// 3. 파일 저장
	    		StillCut moviePoster = new StillCut();
	    		
	    		String posterFileName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함
	    		String posterExt = poster.getOriginalFilename().substring(poster.getOriginalFilename().lastIndexOf(".")+1); 
				
	    		posterFileName = posterFileName + "." + posterExt;   		
				log.debug(TeamColor.JYW + "posterFileName : " + posterFileName);			   					
				
				File f1 = new File(movieForm.getPath() + posterFileName); // 풀네임으로 빈파일을 생성
				
				// 스틸컷 기본 키 출력
				int[] stillCutKey = stillCutMapper.selectStillCut(movieForm.getMovieKey()); 
				log.debug(TeamColor.JYW + "stillCutKey : "+ stillCutKey);
				int i = 1;
				
				moviePoster.setStillCutKey(stillCutKey[0]);
				moviePoster.setPoster("Y");
	    		moviePoster.setOriginName(poster.getOriginalFilename());   
	    		moviePoster.setFileName(posterFileName);
	    		moviePoster.setFileType(poster.getContentType());
	    		moviePoster.setFileSize(poster.getSize());
				// 4. 파일정보를 stillcut 테이블에 저장
				row = stillCutMapper.updateStillCut(moviePoster);
				
				try {
					poster.transferTo(f1);
				} catch (Exception e) {
					e.printStackTrace();
					// 파일업로드에 실패하면
					// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
					// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
					throw new RuntimeException();
				}   		
	    		
				if (row != 0) {
					List<MultipartFile> stillCuts = movieForm.getStillCut();
		    		if(stillCuts != null) {
		    			log.debug(TeamColor.JYW + "MovieController.modifyMovie stillCuts : ");
		    			
		    			for(MultipartFile mf : stillCuts) {
		    				// 3. 파일 저장
		    				StillCut stillCut = new StillCut();
		    				
		    				String originName = mf.getOriginalFilename();
		    				log.debug(TeamColor.JYW + "originName : " + originName);
		    				
		    				String fileName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함
		    				
		    				String ext = originName.substring(originName.lastIndexOf(".")+1); 
		    				
		    				fileName = fileName + "." + ext;
		    				log.debug(TeamColor.JYW + fileName);
		    				
		    				File f = new File(movieForm.getPath() + fileName); // 풀네임으로 빈파일을 생성
		    				// 빈파일에 mf안의 업로드된 파일을 복사
		    				stillCut.setStillCutKey(stillCutKey[i]);
		    				stillCut.setMovieKey(movieForm.getMovieKey());
		    				stillCut.setPoster("N");
		    				stillCut.setOriginName(originName);
		    				stillCut.setFileName(fileName);
		    				stillCut.setFileType(mf.getContentType());
		    				stillCut.setFileSize(mf.getSize());
		    				
		    				// 다음 스틸컷 키 넣어주기
		    				i++;
		    				// 4. 파일정보를 stillcut 테이블에 저장
		    				row = stillCutMapper.updateStillCut(stillCut);
		    				
		    				try {
		    					mf.transferTo(f);
		    				} catch (Exception e) {
		    					e.printStackTrace();
		    					// 파일업로드에 실패하면
		    					// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
		    					// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
		    					throw new RuntimeException();
		    				}   				  				
		    			}
		    		}
	    		}   		    		
	    	}	
    	}
		return row;
	}
	
	// 영화 상세정보 출력
	public ArrayList<Map<String, Object>> getMovieOne(int movieKey) {
		return movieMapper.selectMovieOne(movieKey);
	}
	
	// 영화 목록 출력
	public ArrayList<Map<String, Object>> getMovieList(String startDate) {
		if(startDate.equals("")) {
			 // 오늘 날짜 가져오기
	        LocalDate today = LocalDate.now();
	        
	        // 출력 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	        
	        // 형식에 맞게 출력
	        startDate = today.format(formatter);
		}
		
		return movieMapper.selectMovieList(startDate);
	}
	
	// 영화 등록
	public int addMovie(MovieForm movieForm, String path) {
		// 1+2+3+4 -> 트랜잭션 처리
		
		// movie 테이블(1) : (N) still_cut 테이블
		
		// 1. movie mapper호출(insert -> key반환)
		int movieKey = 0; // insert후 key반환값
		
		Movie movie = new Movie();
    	movie.setMovieTitle(movieForm.getMovieTitle());
    	movie.setMovieInfo(movieForm.getMovieInfo());
    	movie.setMovieSummary(movieForm.getMovieSummary());
    	movie.setGrade(movieForm.getGrade());
    	movie.setOpeningdate(movieForm.getOpeningdate());
    	
    	int row = movieMapper.insertMovie(movie);
    	
    	// movieForm에 path값과 movieKey값 세팅
    	movieForm.setPath(path);
    	movieKey = movie.getMovieKey();
    	
    	// stillCut가 하나 이상일 떄
    	if(movieForm.getStillCut().get(0).getSize() > 0 && row == 1) {
    		log.debug(TeamColor.JYW + "MovieController.addMovie : " + "첨부된 파일이 있습니다.");
    		
    		// 2. 파일 업로드
    		MultipartFile poster = movieForm.getPoster();
    		log.debug(TeamColor.JYW + poster.getOriginalFilename() + poster.getSize());
    		
    		// 3. 파일 저장
    		StillCut moviePoster = new StillCut();
    		
    		String posterFileName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함
    		String posterExt = poster.getOriginalFilename().substring(poster.getOriginalFilename().lastIndexOf(".")+1); 
			
    		posterFileName = posterFileName + "." + posterExt;   		
			log.debug(TeamColor.JYW + "posterFileName : " + posterFileName);			   					
			
			File f1 = new File(movieForm.getPath() + posterFileName); // 풀네임으로 빈파일을 생성
			// 빈파일에 mf안의 업로드된 파일을 복사
			
			moviePoster.setMovieKey(movieKey);
			moviePoster.setPoster("Y");
    		moviePoster.setOriginName(poster.getOriginalFilename());   
    		moviePoster.setFileName(posterFileName);
    		moviePoster.setFileType(poster.getContentType());
    		moviePoster.setFileSize(poster.getSize());
			// 4. 파일정보를 stillcut 테이블에 저장
			row = stillCutMapper.insertStillCutByCrawling(moviePoster);
			
			try {
				poster.transferTo(f1);
			} catch (Exception e) {
				e.printStackTrace();
				// 파일업로드에 실패하면
				// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
				// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
				throw new RuntimeException();
			}   		
    		
			if (row != 0) {
				List<MultipartFile> stillCuts = movieForm.getStillCut();
	    		if(stillCuts != null) {
	    			log.debug(TeamColor.JYW + "MovieController.addMovie stillCut : ");
	    			for(MultipartFile mf : stillCuts) {
	    				// 3. 파일 저장
	    				StillCut stillCut = new StillCut();
	    				
	    				String originName = mf.getOriginalFilename();
	    				log.debug(TeamColor.JYW + "originName : " + originName);
	    				
	    				String fileName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함
	    				
	    				String ext = originName.substring(originName.lastIndexOf(".")+1); 
	    				
	    				fileName = fileName + "." + ext;
	    				log.debug(TeamColor.JYW + fileName);
	    				
	    				File f = new File(movieForm.getPath() + fileName); // 풀네임으로 빈파일을 생성
	    				// 빈파일에 mf안의 업로드된 파일을 복사
	    				
	    				stillCut.setMovieKey(movieKey);
	    				stillCut.setPoster("N");
	    				stillCut.setOriginName(originName);
	    				stillCut.setFileName(fileName);
	    				stillCut.setFileType(mf.getContentType());
	    				stillCut.setFileSize(mf.getSize());
	    				// 4. 파일정보를 stillcut 테이블에 저장
	    				row = stillCutMapper.insertStillCutByCrawling(stillCut);
	    				
	    				try {
	    					mf.transferTo(f);
	    				} catch (Exception e) {
	    					e.printStackTrace();
	    					// 파일업로드에 실패하면
	    					// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
	    					// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
	    					throw new RuntimeException();
	    				}   				  				
	    			}
	    		}
    		}   		    		
    	}		
		return row;
	}
	
	// 영화 크롤링 DB 저장
	public void addMovieByCrawling() throws Exception {
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
        	String[] movieCode_ = url.split("=");
        	
        	int movieCode = Integer.parseInt(movieCode_[1]);
        	String movieTitle = doc.select(".box-contents .title strong").text();
        	String movieInfo = doc.select(".spec").first().text(); 
        	String movieSummary = doc.select(".sect-story-movie").text();
        	String grade = doc.select(".thumb-image i").first().text(); // 18, 15, 12, ALL
        	String reservationRate = reservationRate_[0]; // 00.0
        	String openingdate_ = movieInfo_[1].trim(); // yyyy.mm.dd
        	// 날짜 포맷 형식 변환해주기
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.mm.dd");
        	Date format1 = sdf.parse(openingdate_);
        	
        	sdf.applyPattern("yyyy-mm-dd");
        	String openingdate = sdf.format(format1); // -> yyyy-mm-dd
        	
        	String movieImageLink = doc.select(".thumb-image img").attr("src"); // 이미지 링크
        	Elements movieStillCutLink_ = doc.select(".slider img");
        	// log.debug(TeamColor.CHOI + movieTitle + movieImage + movieInfo + movieSummary + grade + reservationRate + openingdate);
        	
        	// Movie VO
        	Movie movie = new Movie();
        	movie.setMovieCode(movieCode);
        	movie.setMovieTitle(movieTitle);
        	movie.setMovieInfo(movieInfo);
        	movie.setMovieSummary(movieSummary);
        	movie.setGrade(grade);
        	movie.setReservationRate(reservationRate);
        	movie.setOpeningdate(openingdate);
        	
        	// StillCut VO
        	StillCut stillCut = new StillCut();
        	stillCut.setOriginName(movieImageLink);
        	stillCut.setFileName(movieImageLink);
        	stillCut.setPoster("Y");
        	stillCut.setFileType("");
        	stillCut.setFileSize(0);
        	
        	ArrayList<StillCut> stillCutList = new ArrayList<>();
        	for(Element element : movieStillCutLink_) {
        		// log.debug(TeamColor.JYW + "스틸컷링크 : " + element.attr("data-src"));
        		StillCut stillCuts = new StillCut();
            	stillCuts.setOriginName(element.attr("data-src"));
            	stillCuts.setFileName(element.attr("data-src"));
            	stillCut.setPoster("N");
            	stillCuts.setFileType("");
            	stillCuts.setFileSize(0);
            	stillCutList.add(stillCuts);
        	}
        	
        	// 크롤링 영화 데이터와 DB데이터 중복 검사
        	row = movieMapper.selectMovieCk(movieCode); // 1 중복 OR 0 중복아님
        	if(row != 1) { // 중복이 아니면 영화 등록
        		row = movieMapper.insertMovieByCrawling(movie); // 1 성공 OR 0 실패
        		int movieKey = movie.getMovieKey();
        		if(row != 0) {
        			stillCut.setMovieKey(movieKey);
        			stillCutMapper.insertStillCutByCrawling(stillCut); // 포스터 1장, 1 성공 OR 0 실패      
        			for(StillCut s : stillCutList) {
        				s.setMovieKey(movieKey);
        				stillCutMapper.insertStillCutByCrawling(s); // 스틸컷 여러장, 1 성공 OR 0 실패      
        			}
        		}
        	}        	
        }
	}
	
}
