package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.BlackListMapper;
@Service
@Transactional
public class BlackListService {
	@Autowired private BlackListMapper blackListMapper;
	
	//블랙리스트 등록
	public int insultBlackList(String customerId, int reportCategoryKey) {
		
		return blackListMapper.insultBlackList(customerId, reportCategoryKey);
	}
	//블랙리스트 등록
	public int spoilerBlackList(String customerId, int reportCategoryKey) {
		
		return blackListMapper.spoilerBlackList(customerId, reportCategoryKey);
	}
	
}
