package goodee.e1i6.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.OrderService;
import goodee.e1i6.movie.service.SnackService;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Order;

@Controller
public class OrderController {
	@Autowired
	SnackService snackService;
	@Autowired
	OrderService orderService;
	@GetMapping("/customer/order/paymentDir")
	public String paymentdir() {
		
		return "/customer/order/paymentDir";
	}
	@PostMapping("/customer/order/paymentDir")
	public String paymentdir(Order o) {
		
		
		return "redirect:/customer/order/completeOrderOne";
	}
	@GetMapping("/customer/order/paymentCart")
	public String paymentCart() {
		return "/customer/order/paymentCart";
	}
	@PostMapping("/customer/order/paymentCart")
	public String paymentCart(Customer c) {
		
		return "redirect:/customer/order/completeOrder";
	}
	@GetMapping("/customer/order/orderOne")
	public String orderOne(@RequestParam(value="orderKey") int orderKey) {
		
		
		return "/customer/order/orderOne";
	}
	@GetMapping("/customer/order/cartList")
	public String cartList() {
		
		return "customer/order/cartList";
	}
	
}
