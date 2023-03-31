package goodee.e1i6.movie.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.service.EventService;
import goodee.e1i6.movie.service.LoginService;
import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.NoticeService;
import goodee.e1i6.movie.service.PointService;
import goodee.e1i6.movie.service.VisitorService;
import goodee.e1i6.movie.service.WishlistService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Notice;
import goodee.e1i6.movie.vo.PointAccumulate;
import goodee.e1i6.movie.vo.PointRedeem;
import goodee.e1i6.movie.vo.Visitor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	@Autowired VisitorService visitorService;
	@Autowired CouponService couponService; 
	@Autowired EventService eventService; 
	@Autowired LoginService loginService;
	@Autowired PointService pointService;
	@Autowired MovieService movieService;
	@Autowired WishlistService wishlistService;
	@Autowired NoticeService noticeService;
	
	@GetMapping("/home")
	public String getHome(HttpServletRequest request, Model model
							, HttpSession session
							, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
			Visitor visitor = new Visitor();
			int todayVisitorCount = visitorService.getTodayVisitorCount();
        	if (todayVisitorCount == 0) {
        		// 오늘 웹페이지에 첫 방문객일 경우 
        		visitorService.addVisitor(visitor);
        	} else {
        		// 아닐 경우 update
        		visitorService.modifyVisitor(visitor);
        	}
			model.addAttribute("todayCount", todayVisitorCount);
			
			
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			String customerId = "";
			if (customer != null) {
				customerId = customer.getCustomerId();				
			}
			// 공지사항 리스트
			List<Notice> noticeList = noticeService.getHomeNoticeList();
			log.debug(TeamColor.JSM + "공지사항 리스트 :" + noticeList);
			// 영화 목록
			ArrayList<Map<String, Object>> movieList = movieService.getMovieList(startDate);
			List<Map<String, Object>> wishlistCount = wishlistService.getWishlistById(customerId);
			model.addAttribute("movieList", movieList);
			model.addAttribute("wishlistCount", wishlistCount);
			model.addAttribute("customerId", customerId);
			model.addAttribute("noticeList", noticeList);
			
		return "home";
	}
	
	//마이페이지 
	@GetMapping("/customer/mypage")
	public String myPage(HttpSession session,Model model
							,	@RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		String customerId= c.getCustomerId();
		model.addAttribute("customerId", customerId);
		log.debug(TeamColor.KDH + customerId +"<==고객아이디 ");
		
		//내정보 불러오기 
		List<Map<String, Object>> customerOne=loginService.getSelectCustomer(customerId);
		model.addAttribute("co", customerOne);
		log.debug(TeamColor.KDH + customerOne);
		log.debug(TeamColor.KDH + customerOne.get(0).get("customerId")   +"<===??");
		
		//내 쿠폰 목록 
		List<Map<String, Object>> clist = couponService.selectMyCouponList(session, customerId);
		model.addAttribute("clist", clist);
		//내가 참여한 이벤트 목록 
		List<Map<String, Object>> elist = eventService.selectEventListById(customerId);
		model.addAttribute("elist", elist);
		
		//포인트 적립 목록 
		List<PointAccumulate> pointAccumulateList= pointService.pointAccumulateList(currentPage, rowPerPage, customerId);
		//포인트 사용 목록
		List<PointRedeem> pointRedeemList=pointService.pointRedeemList(currentPage, rowPerPage);
		
		//포인트 페이징 하기 위한 총 개수
		int selectCount=couponService.selectCount(rowPerPage);
		log.debug(TeamColor.KDH+selectCount+"<==총 개수");
		int lastPage=selectCount/rowPerPage;
		if(selectCount/rowPerPage !=0) {
			lastPage=lastPage+1;
		}
		int startPage=((currentPage - 1)/rowPerPage) * rowPerPage + 1;
		int endPage=startPage+rowPerPage-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		} 
		
		model.addAttribute("PA", pointAccumulateList);
		model.addAttribute("PR", pointRedeemList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("endPage", endPage);
		return "customer/mypage";
	}
}
