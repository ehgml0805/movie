package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Coupon;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Mycoupon;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CouponController {
	@Autowired CouponService couponService;
	
	//고객
	//내가 다운받은 쿠폰 리스트
	@GetMapping("/employee/coupon/mycouponList")
	public String mycouponList(HttpSession session, Model model) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		List<Mycoupon> mcList=couponService.selectMyCouponList(session, c.getCustomerId());
		model.addAttribute("mc", mcList);
		
		return "/customer/coupon/mycouponList";
	}
	
	
	//관리자
	//쿠폰삭제(처음 잘못 등록시에만 삭제 가능)
	@GetMapping("/employee/coupon/removeCoupon")
	public String removeCoupon(HttpSession session, @RequestParam("couponKey") int couponKey) {
		couponService.removeCoupon(couponKey);
		return "redirect:/employee/coupon/couponList";
	}
	//쿠폰수정
	@GetMapping("/employee/coupon/modifyCoupon")
	public String modifyCoupon(HttpSession session, int couponKey, Model model) {
		Coupon couponOne=couponService.selectCouponOne(couponKey);
		model.addAttribute("co", couponOne);
		log.debug(TeamColor.KDH+couponOne+"<==쿠폰 상세보기");
		
		return "/employee/coupon/modifyCoupon";
	}
	@PostMapping("/employee/coupon/modifyCoupon")
	public String modifyCoupon(HttpSession session, Coupon coupon) {
		
		int row=couponService.modifyCoupon(coupon);
		if(row==1) {
			log.debug(TeamColor.KDH+row+"<==1: 쿠폰 수정 성공");
		}
		return "redirect:/employee/coupon/couponList";
	}
	
	//쿠폰리스트에서 발행 버튼 누르면 발행모달창으로 띄워서 전송
	@PostMapping("/employee/coupon/addCoupon")
	public String addCoupon(HttpSession session, Coupon coupon, Model model) {
		int row= couponService.addCoupon(coupon);
		if(row==0) {
			log.debug(TeamColor.KDH+row+"<==0: 쿠폰 발행 실패");
		}
		log.debug(TeamColor.KDH+row+"<==1: 쿠폰 발행 성공");
		return "redirect:/employee/coupon/couponList";
	}
	//발행 된 쿠폰리스트 
	@GetMapping("/employee/coupon/couponList")
	public String couponList(HttpSession session, Model model
								, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		//페이징 하기 위한 총 개수
		int selectCount=couponService.selectCount(rowPerPage);
		log.debug(TeamColor.KDH+selectCount+"<==총 개수");
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage-1)*rowPerPage)*rowPerPage+1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		
		List<Coupon> clist=couponService.getAllCouponList(currentPage, rowPerPage);
		model.addAttribute("clist", clist);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		
		return "/employee/coupon/couponList";
	}
}
