package goodee.e1i6.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import goodee.e1i6.movie.service.WishlistService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WishlistController {
	@Autowired WishlistService wishlistService;
	
	
}
