package goodee.e1i6.movie.controller;

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
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class SnackController {
	
	@Autowired
	SnackService snackService;
	@Autowired
	OrderService OrderService;
	
	//고객
	@GetMapping("/snack/snackHome")
	public String SnackHome(Model model) {
		//베스트 상품 노출
		List<Snack> best = snackService.selectSnackByHit();
		model.addAttribute("best", best);
		for(int i =1; i<=5; i++) {
			//카테고리 번호 번호 받아서 리스트 출력
			List<Snack> list = snackService.snackListByCategoryNo(i);
			model.addAttribute("snack"+i, list);
			
		}
		
		return "/customer/snack/snackHome";
	
	}
	//스낵상세보기
	@GetMapping("/snack/snackOne")
	public String snackOne(Model model
							, @RequestParam(value="snackKey") int snackKey
							, @RequestParam(value="row",defaultValue="3") int row) {
		Snack s = snackService.snackOne(snackKey);
		model.addAttribute("s", s);
		//베스트 상품 하단에 깔아주려고
		List<Snack> b = snackService.selectSnackByHit();
		model.addAttribute("best", b);		
		model.addAttribute("row", row);
		
		return "/customer/snack/snackOne";		
	}
	
	//검색
	@GetMapping("/snack/searchSnack")	
	public String searchSnack( @RequestParam(value="word") String word, Model model) {
		List<Snack> list= snackService.selectsnackBySearch(word);
		model.addAttribute("list", list);
			
		return "/customer/snack/searchSnack";
	}
	
	@PostMapping("/customer/snack/insertCart")
	public String insertCart(HttpSession session, Cart c) {
		Customer loginCust = (Customer)session.getAttribute("loginCustomer");
		c.setCustomerId(loginCust.getCustomerId());		
		int row= OrderService.insertCart(c);
		
		return "redirect:/snack/snackOne?snackKey="+c.getSnackKey()+"&row="+row;
		
	}
	
	
	//관리자
	//스낵추가
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
		String path = request.getServletContext().getRealPath("/snackImg/");
		int row = snackService.insertSnack(s, mf, path);
		return "redirect:/employee/snack/addSnack?row="+row;
	}
	//스낵삭제
	@GetMapping("employee/snack/deleteSnack")
	public String deleteSnack(@RequestParam(value="snackKey") int snackKey) {
		snackService.deleteSnack(snackKey);
		
		
		return "redirect:/snack/snackHome";
	}
	
}
