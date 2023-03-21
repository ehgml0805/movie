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
	
	// 이미 찜한 영화인지 체크
	@GetMapping("/customer/wishlist/wishlistCheck")
	public int addWishlistByMovie(HttpSession session, @RequestParam(value="movieKey") int movieKey) {
		log.debug(TeamColor.YIB + "WishlistCheck--");
		log.debug(TeamColor.YIB + movieKey + " : movieKey");
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		
		int check = wishlistService.getWishlistCheckById(customerId, movieKey);
		log.debug(TeamColor.YIB + check + " : check");
		// 이미 찜 했으면 찜 해제
		if(check == 1) {
			log.debug(TeamColor.YIB + "찜 해제--");
			int result = wishlistService.removeWishlistByMovie(customerId, movieKey);
			log.debug(TeamColor.YIB + result + "result");
			if (result == 1) {
				result = 10; // 10 = 찜 해제
			}
			return result;
		}
		// 찜 안되어 있으면 찜 하기
		log.debug(TeamColor.YIB + "찜 add--");
		int result = wishlistService.addWishlistByMovie(customerId, movieKey);
		log.debug(TeamColor.YIB + result + "result");
		if (result == 1) {
			result = 20; // 20 = 찜 완료
		}
		return result;
	}
	
	
}