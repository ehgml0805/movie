package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import ch.qos.logback.classic.spi.STEUtil;
import goodee.e1i6.movie.vo.Coupon;
import goodee.e1i6.movie.vo.Mycoupon;

@Mapper
public interface CouponMapper {
		//월별 발행(등록) 쿠폰 
		int mic();
		
		//내려받은 쿠폰 사용
		int updateMycoupon(Mycoupon mycoupon);
		//쿠폰 내려 받기
		int insertMyCoupon(Mycoupon mycoupon);
		//내 쿠폰 리스트 출력
		List<Mycoupon> selectMyCouponList(String customerId);
		

		//쿠폰삭제(처음 잘못 등록시에만 삭제 가능)
		int deleteCoupon(int couponKey);
		//쿠폰수정
		int updateCoupon(Coupon coupon);
		//쿠폰 발행(등록)
		int insertCoupon(Coupon coupon);
		//쿠폰 상세보기
		Coupon selectCouponOne(int couponKey);
		//쿠폰 마지막 페이징
		int selectCount(int couponKey);
		//모든 쿠폰 리스트 출력
		List<Coupon> selectAllCouponList(Map<String, Object> paramMap);
}
