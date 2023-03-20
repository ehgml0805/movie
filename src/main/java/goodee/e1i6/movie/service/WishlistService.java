package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.WishlistMapper;
import goodee.e1i6.movie.vo.Wishlist;

@Service
@Transactional
public class WishlistService {
	@Autowired WishlistMapper wishlistMapper;
	
	// 영화 찜 하기
	public int addWishlistByMovie(String customerId, int movieKey) {
		Wishlist wishlist = new Wishlist();
		wishlist.setCustomerId(customerId);
		wishlist.setMovieKey(movieKey);
		return wishlistMapper.insertWishlist(wishlist);
	}
	
	// 영화 찜 해제
	public int removeWishlistByMovie(String customerId, int movieKey) {
		Wishlist wishlist = new Wishlist();
		wishlist.setCustomerId(customerId);
		wishlist.setMovieKey(movieKey);
		return wishlistMapper.deleteWistlist(wishlist);
	}
	
}
