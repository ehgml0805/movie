package goodee.e1i6.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.WishlistMapper;
import goodee.e1i6.movie.vo.Wishlist;

@Service
@Transactional
public class WishlistService {
	@Autowired WishlistMapper wishlistMapper;
	
	// 찜한 영화인지 확인
	public int getWishlistCheckById(String customerId, int movieKey) {
		Wishlist wishlist = new Wishlist();
		wishlist.setCustomerId(customerId);
		wishlist.setMovieKey(movieKey);
		return wishlistMapper.selectWishlistCheckById(wishlist);
	}
	
	// 영화별 찜 리스트 확인
	public List<Map<String, Object>> getWishlistById(String customerId) {
		return wishlistMapper.selectWishlistById(customerId);
	}
	
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
