package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Wishlist;

@Mapper
public interface WishlistMapper {
	
	// 영화 찜 하기
	int insertWishlist(Wishlist wishlist);
	// 영화 찜 해제
	int deleteWistlist(Wishlist wishlist);
}
