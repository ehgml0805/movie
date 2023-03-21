package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.service.EventService;
import goodee.e1i6.movie.service.LoginService;
import goodee.e1i6.movie.service.VisitorService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Visitor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	@Autowired VisitorService visitorService;
	@Autowired CouponService couponService; 
	@Autowired EventService eventService; 
	@Autowired LoginService loginService;
	
	
	@GetMapping("/home")
	public String getHome(HttpServletRequest request, Model model) {
		
			String[] arr = {"a","b","c","d","e"};
			
			for(int i = 0; i < arr.length; i++) {
				for(int j = 1; j < 13; j++) {
					String seatNumber = arr[i] + (j);			
					//System.out.println(seatNumber);					
				}
			}
			
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
			
		return "home";
	}
	
	@GetMapping("/customer/mypage")
	public String myPage(HttpSession session,Model model) {
		Customer c = (Customer)session.getAttribute("loginCustomer");
		String customerId= c.getCustomerId();
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
		
		return "customer/mypage";
	}
}
