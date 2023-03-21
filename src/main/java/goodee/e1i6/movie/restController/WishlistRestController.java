package goodee.e1i6.movie.restController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.e1i6.movie.service.WishlistService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class WishlistRestController {
	@Autowired WishlistService wishlistService;
	
	// 영화 찜 하기
	@GetMapping("/customer/wishlist/addWishlist")
	public int addWishlistByMovie(HttpSession session, @RequestParam(value="movieKey") int movieKey) {
		log.debug(TeamColor.YIB + "add Wishlist--");
		log.debug(TeamColor.YIB + movieKey + " : movieKey");
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		return wishlistService.addWishlistByMovie(customerId, movieKey);
	}
	
	// 영화 찜 해제
	@GetMapping("/customer/wishlist/removeWishlist")
	public int removeWishlistByMovie(HttpSession session, @RequestParam(value="movieKey") int movieKey) {
		log.debug(TeamColor.YIB + "remove Wishlist--");
		log.debug(TeamColor.YIB + movieKey + " : movieKey");
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		return wishlistService.removeWishlistByMovie(customerId, movieKey);
	}
	
}