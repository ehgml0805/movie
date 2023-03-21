package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Wishlist;

@Mapper
public interface WishlistMapper {
	
	// 찜한 영화인지 체크
	int selectWishlistCheckById(Wishlist wishlist);
	// 영화별 찜 리스트 확인
	List<Map<String, Object>> selectWishlistById(String customerId);
	// 영화 찜 하기
	int insertWishlist(Wishlist wishlist);
	// 영화 찜 해제
	int deleteWistlist(Wishlist wishlist);
}
