package goodee.e1i6.movie.controller;

import java.util.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/homeEx")
	public String getHome() {
		
			String[] arr = {"a","b","c","d","e"};
			
			for(int i = 0; i < arr.length; i++) {
				for(int j = 1; j < 13; j++) {
					String seatNumber = arr[i] + (j);			
					System.out.println(seatNumber);					
				}
			}
		
		return "homeEx";
	}
}
