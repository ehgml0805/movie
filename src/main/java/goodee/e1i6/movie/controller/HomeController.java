package goodee.e1i6.movie.controller;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.e1i6.movie.service.VisitorService;

@Controller
public class HomeController {
	@Autowired VisitorService visitorService;
	
	@GetMapping("/homeEx")
	public String getHome(Model model) {
		
			String[] arr = {"a","b","c","d","e"};
			
			for(int i = 0; i < arr.length; i++) {
				for(int j = 1; j < 13; j++) {
					String seatNumber = arr[i] + (j);			
					System.out.println(seatNumber);					
				}
			}
			
			int todayVisitorCount = visitorService.getTodayVisitorCount();
			model.addAttribute("todayCount", todayVisitorCount);
			
		return "homeEx";
	}
	
	@GetMapping("/customer/mypage")
	public String myPage() {
		return "customer/mypage";
	}
}
