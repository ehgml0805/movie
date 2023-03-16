package goodee.e1i6.movie.scheduler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import goodee.e1i6.movie.mapper.EventCommentMapper;
import goodee.e1i6.movie.mapper.ReviewMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Review;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class BlackListShrduler {
	@Autowired private ReviewMapper reviewMapper;
	@Autowired private EventCommentMapper eventCommentMapper;
	
	@Scheduled(cron = "* * * 1 * *")
	public void addBlackList() {
		
		List<Review> rlist= reviewMapper.ReviewList();
		log.debug(TeamColor.KDH + rlist);
		
		for(Review r: rlist) {
			int insultReport =(int) r.getInsultReport();
			String customerId= r.getCustomerId();
			
			if(insultReport==5) {
				
			}
		}
		
		
	}
	
}
