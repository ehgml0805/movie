package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.PointAccumulate;
import goodee.e1i6.movie.vo.PointRedeem;

@Mapper
public interface PointMapper {

	
		//포인트 적립 
		int insertPointAccumulat(int pointAccumulateKey);
		//포인트 사용 
		int usePointRedeem(int pointRedeemKey);
	
		//포인트 적립 목록  
		List<PointAccumulate> pointAccumulateList(Map<String, Object> paramMap);
		//포인트 사용 목록
		List<PointRedeem> pointRedeemList(Map<String, Object> paramMap);
}
