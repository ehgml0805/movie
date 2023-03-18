package goodee.e1i6.movie.controller;

import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.service.VisitorService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	@Autowired VisitorService visitorService;
	@Autowired CouponService couponService; 
	
	@GetMapping("/homeEx")
	public String getHome(Model model) {
		
			String[] arr = {"a","b","c","d","e"};
			
			for(int i = 0; i < arr.length; i++) {
				for(int j = 1; j < 13; j++) {
					String seatNumber = arr[i] + (j);			
					//System.out.println(seatNumber);					
				}
			}
			
			int todayVisitorCount = visitorService.getTodayVisitorCount();
			model.addAttribute("todayCount", todayVisitorCount);
			
		return "homeEx";
	}
	
	@GetMapping("/customer/mypage")
	public String myPage(HttpSession session) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		String customerId= c.getCustomerId();
		log.debug(TeamColor.KDH + customerId +"<==고객아이디 ");
		
		
		return "customer/mypage";
	}
}
