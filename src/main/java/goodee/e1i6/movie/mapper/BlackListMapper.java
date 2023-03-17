package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BlackListMapper {
	//블랙리스트 추가
	int insultBlackList(String customerId, int reportCategoryKey);
	int spoilerBlackList(String customerId, int reportCategoryKey);
}
