package goodee.e1i6.movie.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import goodee.e1i6.movie.mapper.BlackListMapper;
import goodee.e1i6.movie.mapper.EventCommentMapper;
import goodee.e1i6.movie.mapper.ReviewMapper;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class BlackListShrduler {
	@Autowired private ReviewMapper reviewMapper;
	@Autowired private EventCommentMapper eventCommentMapper;
	@Autowired private BlackListMapper blackList;
	
	/*
	 * @Scheduled(cron = "* 0/1 * * * *") public void addBlackList() {
	 * 
	 * List<Review> rlist= reviewMapper.ReviewList(); log.debug(TeamColor.KDH +
	 * rlist);
	 * 
	 * for(Review r: rlist) { 
	 * int insultReport =(int) r.getInsultReport(); String
	 * customerId= (String) r.getCustomerId(); //insultReport= 욕이나 비방
	 * if(insultReport==5) { 
	 * int reportCategoryKey=2;
	 * blackList.insertBlackList(customerId, reportCategoryKey); } }
	 * 
	 * }
	 */
	
}
