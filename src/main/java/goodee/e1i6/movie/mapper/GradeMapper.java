package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Customer;

@Mapper
public interface GradeMapper {
	
	// 매달 고객등급 갱신
	int updateVip( );
	
	int updateGold( );
	
	int updateSilver( );
	
	
	

}
