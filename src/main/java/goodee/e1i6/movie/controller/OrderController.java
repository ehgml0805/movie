package goodee.e1i6.movie.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.service.OrderService;
import goodee.e1i6.movie.service.SnackService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Cart;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Mycoupon;
import goodee.e1i6.movie.vo.Order;
import goodee.e1i6.movie.vo.Snack;
import goodee.e1i6.movie.vo.TotalOrder;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class OrderController {
	@Autowired
	SnackService snackService;
	@Autowired
	OrderService orderService;
	@Autowired CouponService couponService;
	
	@PostMapping("/customer/order/paymentDir")
	public String paymentdir(HttpSession session,@RequestParam(value="snackKey") int snackKey, Model model, @RequestParam(value= "cartQuantity") int Quantity) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		Snack s = snackService.snackOne(snackKey);
		model.addAttribute("s", s);
		model.addAttribute("c", c);
		model.addAttribute("quantity", Quantity);
		return "/customer/order/paymentDir";
	}
	
	
	@PostMapping("/customer/order/paymentDirect")
	public String paymentdir(HttpSession session, Order o,HttpServletRequest request) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		o.setCustomerId(c.getCustomerId());
		String path = request.getServletContext().getRealPath("/snack-upload/");
		int row= orderService.insertOrderDir(o, path);
		TotalOrder t = new TotalOrder();
		t.setTotalPrice(o.getOrderPrice());
		t.setCustomerId(c.getCustomerId());
		orderService.insertTotalOrder(t);
		return "redirect:/customer/order/completeOrderOne?orderKey="+row;
	}
	
	//결제하기 
	@GetMapping("/customer/order/paymentCart")
	public String paymentCart(HttpSession session, Model model) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		List<Cart> list = orderService.selectCartListBySelect(c.getCustomerId());
		if(list.isEmpty()) {
			
			return "redirect:/customer/order/cartList";
		}
		int sum = orderService.selectSumgoodsPrice(c.getCustomerId());
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		
		//쿠폰 리스트 출력 
		List<Map<String, Object>> clist=couponService.selectMyCouponList(session, c.getCustomerId());
		model.addAttribute("clist", clist);
		
		//오늘 날짜와 비교 해서 오늘 날짜보다 쿠폰의 사용 가능 날짜가 전이면 사용 불가 
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowTime1 = sdf1.format(now);
		model.addAttribute("nowTime1", nowTime1);
		log.debug(TeamColor.KDH + nowTime1);
		
		
		return "/customer/order/paymentCart";
	}
	@PostMapping("/customer/order/paymentCart")
	public String paymentCart(HttpSession session, HttpServletRequest request,Mycoupon mycoupon
								, String mycouponKey) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		List<Cart> list = orderService.selectCartListBySelect(c.getCustomerId());
		String path = request.getServletContext().getRealPath("/snack-upload/");
		int order = orderService.inserOrderByCart(list, c.getCustomerId(), path);
		
		int row=couponService.modifyMycoupon(mycoupon);
		log.debug(TeamColor.KDH +row + "<==1 수정성공 ");
		
		return "redirect:/customer/order/completeOrder";
	}
	
	
	@GetMapping("/customer/order/orderOne")
	public String orderOne(@RequestParam(value="orderKey") int orderKey, Model model) {
		Order o = orderService.selectOrderOne(orderKey);
		Snack s = snackService.snackOne(o.getSnackKey());
		
		model.addAttribute("s", s);
		model.addAttribute("o", o);
		
		
		
		return "/customer/order/orderOne";
	}
	
	//장바구니 목록 
	@GetMapping("/customer/order/cartList")
	public String cartList(HttpSession session, Model model) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		List<Cart> list = orderService.selectCartListbyid(c.getCustomerId());
		model.addAttribute("list", list);
		List<Snack> hit = snackService.selectSnackByHit();
		Integer sum =orderService.selectSumgoodsPrice(c.getCustomerId());
		model.addAttribute("hit", hit);
		model.addAttribute("sum", sum);
		
		return "customer/order/cartList";
	}
	
	
	@GetMapping("/customer/order/completeOrder")
	public String completeOrder(HttpSession session, Model model) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		List<Cart> list = orderService.selectCartListBySelect(c.getCustomerId());
		int sum = orderService.selectSumgoodsPrice(c.getCustomerId());
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		
		orderService.deleteCartById(c.getCustomerId());
		return "/customer/order/completeOrder";
	}
	
	
	@GetMapping("/customer/order/completeOrderOne")
	public String completeOrderOne(HttpSession session, Model model,@RequestParam(value="orderKey") int orderKey) {
		
		Order o = orderService.selectOrderOne(orderKey);
		Snack s = snackService.snackOne(o.getSnackKey());
		model.addAttribute("o", o);
		model.addAttribute("s", s);
		return "/customer/order/completeOrderOne";
	}
	
	
	@GetMapping("/customer/order/orderPage")
	public String orderPage(HttpSession session, Model model) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		List<Map<String, Object>> list = orderService.selectOrderListByid(c.getCustomerId());
		model.addAttribute("list", list);
		return  "/customer/order/orderPage";
	}
	@PostMapping("/customer/order/updateCartQuantity")
	public String updateCart(HttpSession session, Cart c) {
		Customer cust = (Customer)session.getAttribute("loginCustomer");
		c.setCustomerId(cust.getCustomerId());
		orderService.updateCartQuantity(c);
		
		return "redirect:/customer/order/cartList";
	}
	
	
	@GetMapping("/customer/order/deleteCart")
	public String deleteCartOne(HttpSession session, @RequestParam(value="snackKey") int snackKey) {
		Customer cust = (Customer)session.getAttribute("loginCustomer");
		Cart c = new Cart();
		c.setSnackKey(snackKey);
		c.setCustomerId(cust.getCustomerId());
		orderService.deleteCartOne(c);
		
		return "redirect:/customer/order/cartList"; 
	}
	
	
	@GetMapping("/customer/order/totalOrderList")
	public String totalOrderList(HttpSession session, Model model) {
		Customer cust = (Customer)session.getAttribute("loginCustomer");
		List<TotalOrder> list = orderService.selectTotalOrderById(cust.getCustomerId());
		model.addAttribute("list", list);
		
		return "/customer/order/totalOrderList";
	}
	@PostMapping("/customer/order/selectCart")
	public String selectCart(HttpSession session, @RequestParam(value="snackKey") int snackKey, @RequestParam(value="selected", defaultValue="0") int selected) {
		Cart c = new Cart();
		c.setSnackKey(snackKey);
		c.setSelected(selected);
		Customer cust = (Customer)session.getAttribute("loginCustomer");
		c.setCustomerId(cust.getCustomerId());
		orderService.selectOne(c);
		return "redirect:/customer/order/cartList";
	}
}
