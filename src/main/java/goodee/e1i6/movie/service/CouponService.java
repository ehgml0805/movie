package goodee.e1i6.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.CouponMapper;
import goodee.e1i6.movie.vo.Coupon;
@Service
@Transactional
public class CouponService {
	@Autowired private CouponMapper couponMapper;
	
	//쿠폰 삭제(처음 잘못 등록시에만 삭제 가능)
	public int removeCoupon(int couponKey) {
		return couponMapper.deleteCoupon(couponKey);
	}
	//쿠폰 발행(등록)
	public int addCoupon(Coupon coupon) {
		return couponMapper.insertCoupon(coupon);
	}
	//쿠폰 상세보기
	public Coupon selectCouponOne(int couponKey) {
		return couponMapper.selectCouponOne(couponKey);
	}
	//페이징 총 개수
	public int selectCount (int couponKey) {
		return couponMapper.selectCount(couponKey);
	}
	//모든 발행 쿠폰 목록
	public List<Coupon> getAllCouponList(int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage; //0변부터 출력할 거~ rowPwePage 개수만큼 출력
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage); //몇개씩 보여줄거
		return couponMapper.selectAllCouponList(paramMap);
	}
}
