package goodee.e1i6.movie.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.service.OrderService;
import goodee.e1i6.movie.service.SnackService;
import goodee.e1i6.movie.vo.Cart;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Snack;
import goodee.e1i6.movie.vo.SnackCategory;

@Controller
public class SnackController {
	
	@Autowired
	SnackService snackService;
	@Autowired
	OrderService OrderService;
	
	
	@GetMapping("/snack/snackHome")
	public String SnackHome(Model model) {
		List<Snack> best = snackService.selectSnackByHit();
		model.addAttribute("best", best);
		for(int i =1; i<=5; i++) {
			List<Snack> list = snackService.snackListByCategoryNo(i);
			model.addAttribute("snack"+i, list);
			
		}
		
		return "/customer/snack/snackHome";
	
	}
	@GetMapping("/snack/snackOne")
	public String snackOne(Model model,
			@RequestParam(value="snackKey") int snackKey) {
		Snack s = snackService.snackOne(snackKey);
		model.addAttribute("s", s);
		List<Snack> b = snackService.selectSnackByHit();
		model.addAttribute("best", b);		
		return "/customer/snack/snackOne";		
	}

	@PostMapping("/customer/snack/insertCart")
	public String insertCart(HttpSession session,Cart c) {
		Customer loginCust = (Customer)session.getAttribute("loginCustomer");
		c.setCustomerId(loginCust.getCustomerId());		
		int row= OrderService.insertCart(c);
		return "redirect:/snack/snackOne?row="+row;
	}
	@GetMapping("/employee/snack/addSnack")
	public String addSnack(Model model) {
	
		List<SnackCategory> category = snackService.selectCateogry();
		model.addAttribute("category", category);
		
		
		return "/employee/snack/addSnack";
	}
	@PostMapping("/employee/snack/insertSnack")
	public String addSnack(Snack s,
			HttpServletRequest request) {
		MultipartFile mf = s.getMf();
		String path = request.getServletContext().getRealPath("/snack-upload/");
		int row = snackService.insertSnack(s, mf, path);
		return "redirect:/employee/snack/addSnack?row="+row;
	}
	@GetMapping("/snack/searchSnack")	
	public String searchSnack(
			@RequestParam(value="word") String word,
			Model model) {
		List<Snack> list= snackService.selectsnackBySearch(word);
		model.addAttribute("list", list);
			
		return "/customer/snack/searchSnack";
	}
	@GetMapping("employee/snack/deleteSnack")
	public String deleteSnack(@RequestParam(value="snackKey") int snackKey) {
		snackService.deleteSnack(snackKey);
		
		
		return "redirect:/snack/snackHome";
	}
	
}
