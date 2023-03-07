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
import goodee.e1i6.movie.vo.Coupon;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CouponController {
	@Autowired CouponService couponService;
	
	
	//쿠폰삭제(처음 잘못 등록시에만 삭제 가능)
	@PostMapping("/employee/coupon/removeCoupon")
	public String removeCoupon(HttpSession session, @RequestParam("couponKey") int couponKey) {
		couponService.removeCoupon(couponKey);
		return "redirect:/employee/coupon/couponList";
	}
	
	//쿠폰리스트에서 발행 버튼 누르면 발행모달창으로 띄워서 전송
	@PostMapping("/employee/coupon/addCoupon")
	public String addCoupon(HttpSession session, Coupon coupon, Model model) {
		int row= couponService.addCoupon(coupon);
		if(row==0) {
			log.debug(0+"<==쿠폰 발행 실패");
		}
		log.debug(1+"<==쿠폰 발행 성공");
		return "redirect:/employee/coupon/couponList";
	}
	@GetMapping("/employee/coupon/couponList")
	public String couponList(HttpSession session, Model model
								, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		//페이징 하기 위한 총 개수
		int selectCount=couponService.selectCount(rowPerPage);
		log.debug("selectCount");
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
