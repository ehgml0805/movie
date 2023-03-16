package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.BlackListMapper;
@Service
@Transactional
public class BlackListService {
	@Autowired private BlackListMapper blackListMapper;
	
	//쿠폰 발행(등록)
	public int addBlackList(String customerId, int reportCategoryKey) {
		
		return blackListMapper.insertBlackList(customerId, reportCategoryKey);
	}
	
}
