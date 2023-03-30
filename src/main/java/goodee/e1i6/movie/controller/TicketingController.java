package goodee.e1i6.movie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.CouponService;
import goodee.e1i6.movie.service.KaKaoService;
import goodee.e1i6.movie.service.LoginService;
import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.PointService;
import goodee.e1i6.movie.service.ScreeningScheduleService;
import goodee.e1i6.movie.service.SeatService;
import goodee.e1i6.movie.service.StillCutService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.service.TicketingService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Mycoupon;
import goodee.e1i6.movie.vo.PointRedeem;
import goodee.e1i6.movie.vo.Seat;
import goodee.e1i6.movie.vo.StillCut;
import goodee.e1i6.movie.vo.Ticketing;
import goodee.e1i6.movie.vo.TicketingSeat;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketingController {
	@Autowired MovieService movieService;
	@Autowired TheaterService theaterService;
	@Autowired ScreeningScheduleService screeningScheduleService;
	@Autowired StillCutService stillCutService;
	@Autowired SeatService seatService;
	@Autowired CouponService couponService;
	@Autowired KaKaoService kaKaoService;
	@Autowired TicketingService ticketingService;
	@Autowired PointService pointService;
	@Autowired LoginService loginService;
	
	// 영화, 극장, 날짜 선택
	@GetMapping("/ticketing/screenList")
	public String getScreenList(Model model
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey
									, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		List<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		List<Map<String, Object>> theaterRegionList = theaterService.getTheaterRegionList();
		
		model.addAttribute("theaterRegionList", theaterRegionList);
		model.addAttribute("movieList", movieList);	
		
		model.addAttribute("movieKey", movieKey);
		
		return "/customer/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/screenList2")
	public String getScreenList2(Model model
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey
									, @RequestParam(value = "startDate", defaultValue = "") String startDate) {
		List<Map<String, Object>> movieList = movieService.getMovieList(startDate);
		List<Map<String, Object>> theaterRegionList = theaterService.getTheaterRegionList();
		
		model.addAttribute("theaterRegionList", theaterRegionList);
		model.addAttribute("movieList", movieList);
		
		model.addAttribute("movieKey", movieKey);
		
		return "/customer/ticketing/screenList2";
	}
	
	// 좌석 선택
	@GetMapping("/ticketing/ticketingSeat")
	public String ticketingSeat(Model model
									, @RequestParam(value = "scheduleKey", defaultValue = "0") int scheduleKey) {
		
		Map<String, Object> scheduleOne = screeningScheduleService.getScreeningScheduleOne(scheduleKey);
		model.addAttribute("scheduleOne", scheduleOne);	
		
		int screenroomKey = (int)scheduleOne.get("screenroomKey");
		List<Seat> seatList = seatService.getSeatListByScreenroom(screenroomKey);
		model.addAttribute("seatList", seatList);	
		
		StillCut stillCut = stillCutService.getStillCutOneByTicketing((Integer)scheduleOne.get("movieKey"));
		model.addAttribute("stillCut", stillCut);	
		
		return "/customer/ticketing/ticketingSeat";
	}
	
	@GetMapping("/ticketing/ticketingSeat2")
	public String ticketingSeat2(Model model
									, @RequestParam(value = "scheduleKey", defaultValue = "0") int scheduleKey) {
		
		Map<String, Object> scheduleOne = screeningScheduleService.getScreeningScheduleOne(scheduleKey);
		model.addAttribute("scheduleOne", scheduleOne);	
		
		int screenroomKey = (int)scheduleOne.get("screenroomKey");
		List<Seat> seatList = seatService.getSeatListByScreenroom(screenroomKey);
		model.addAttribute("seatList", seatList);	
		
		StillCut stillCut = stillCutService.getStillCutOneByTicketing((Integer)scheduleOne.get("movieKey"));
		model.addAttribute("stillCut", stillCut);	
		
		return "/customer/ticketing/ticketingSeat2";
	}
	
	// 결제하기
	@GetMapping("/ticketing/ticketingPay")
	public String ticektingPay(Model model, HttpSession session
									, @RequestParam(value = "scheduleKey", defaultValue = "0") int scheduleKey
									, @RequestParam(value = "movieKey", defaultValue = "0") int movieKey
									, @RequestParam(value = "seatKey", defaultValue = "0") int[] seatKey
									, @RequestParam(value = "seatNumber", defaultValue = "0") String[] seatNumber
									, @RequestParam(value = "adultNo", defaultValue = "0") int adultNo
									, @RequestParam(value = "teenagerNo", defaultValue = "0") int teenagerNo
									, @RequestParam(value = "totalAmount", defaultValue = "0") int totalAmount) {
		
		/* 예매 정보 상태 불러오기 */
		
		// 영화, 극장, 스케줄 정보
		Map<String, Object> scheduleOne = screeningScheduleService.getScreeningScheduleOne(scheduleKey);
		model.addAttribute("scheduleOne", scheduleOne);	
		
		StillCut stillCut = stillCutService.getStillCutOneByTicketing(movieKey);
		model.addAttribute("stillCut", stillCut);	
		
		// 인원 정보
		model.addAttribute("adultNo", adultNo);
		model.addAttribute("teenagerNo", teenagerNo);
		
		// 좌석 정보
		int[] seatKey_ = new int[seatKey.length];
		for(int i=0; i<seatKey.length; i++) {
			seatKey_[i] = seatKey[i];
		}
		model.addAttribute("seatKey", seatKey_);
		String[] seatNumber_ = new String[seatNumber.length];
		for(int i=0; i<seatNumber.length; i++) {
			seatNumber_[i] = seatNumber[i];
		}
		model.addAttribute("seatNumber", seatNumber_);
		
		// 가격 정보
		model.addAttribute("totalPrice", totalAmount);
		
		// 사용가능한 쿠폰 불러오기
		Customer customer = (Customer)session.getAttribute("loginCustomer");
		List<Map<String, Object>> myCouponList = couponService.selectMyCouponList(session, customer.getCustomerId());
		model.addAttribute("myCouponList", myCouponList);
		
		// 사용 가능한 포인트 불러오기
		int point = customer.getCustomerPoint();
		model.addAttribute("point", point);
		
		return "/customer/ticketing/ticketingPay";
	}
	
	// 예매 수정
	@GetMapping("/ticketing/modifyTicekting")
	public String modifyTicekting(Model model
									, @RequestParam(value = "ticketingKey", defaultValue = "0") int ticketingKey) {
		
		
		return "/customer/ticketing/modifyTicekting";
	}
	@PostMapping("/ticketing/modifyTicekting")
	public String modifyTicekting(Model model
									, @RequestParam(value = "ticketing", defaultValue = "") Ticketing ticketing) {
		
		
		return "/customer/ticketing/modifyTicekting";
	}
	
	// 예매 추가
	@PostMapping("/ticketing/addTicketing")
	public String addTicekting(Model model
									, @RequestParam(value = "ticketing", defaultValue = "0") Ticketing ticketing) {
			
			
		return "/customer/ticketing/ticketingPay";
	}
	
	// 카카오페이 결제 승인 시
	@GetMapping("/ticketing/kakaopaySuccess")
    public String kakaopaySuccess(Model model, HttpSession session
    							, @RequestParam(value = "pg_token", required = true) String pg_token) {
    	log.debug(TeamColor.JYW + "kakaopaySuccess GET ");
    	log.debug(TeamColor.JYW + "kakaopaySuccess pg_token : " + pg_token);
    	
    	Ticketing ticketing = (Ticketing)session.getAttribute("ticketing");
    	int[] seatKey = (int[])session.getAttribute("seatKey");
    	int usePoint = (int)session.getAttribute("usePoint");
    	
    	log.debug(TeamColor.JYW + "kakaopaySuccess ticketing : " + ticketing);
    	log.debug(TeamColor.JYW + "kakaopaySuccess seatKey : " + seatKey);
    	log.debug(TeamColor.JYW + "kakaopaySuccess usePoint : " + usePoint);
    	
    	model.addAttribute("info", kaKaoService.KakaopayApprove(pg_token, session));
    	
    	Customer customer = (Customer)session.getAttribute("loginCustomer");
    	String msg = "";
    	
    	// 1. 예매 내역을 DB ticketing 테이블에 저장
    	int row = ticketingService.addTicketing(ticketing);
    	if (row != 0) {
    		int seatRow = 0;
    		int pointRow = 0;
    		int customerRow = 0;
    		int couponRow = 0;
    		for(int i=0; i<seatKey.length; i++) {
    			int sKey = seatKey[i];
	    		TicketingSeat ticketingSeat = new TicketingSeat();
	    		ticketingSeat.setTicketingKey(ticketing.getTicketingKey());
	    		ticketingSeat.setSeatKey(sKey);
	    		// 2. 예매 내역을 DB ticketing_seat 테이블에 저장
	    		seatRow = ticketingService.addTicketingSeat(ticketingSeat);
    		}
    		if(seatRow != 0) {
    			PointRedeem pointRedeem = new PointRedeem();
    			pointRedeem.setPointCategory("예매");
    			pointRedeem.setKey(ticketing.getTicketingKey());
    			pointRedeem.setCustomerId(ticketing.getCustomerId());
    			pointRedeem.setPoint(usePoint);
    			// 3. 예매 후 포인트 내역을 DB point_redeem 테이블에 저장
    			pointRow = pointService.insertPointRedeem(pointRedeem);
    			if(pointRow != 0) {
    				int myPoint = (int)customer.getCustomerPoint();
    				myPoint = myPoint - usePoint;
    				Customer paramCustomer = new Customer();
    				paramCustomer.setCustomerId(customer.getCustomerId());
    				paramCustomer.setCustomerPoint(myPoint);
    				// 4. 예매 후 포인트 내역을 DB customer 테이블에 저장
    				customerRow = loginService.updateCustomerPoint(paramCustomer);
    				if(customerRow != 0) {
    					Mycoupon mycoupon = new Mycoupon();
    					mycoupon.setMycouponKey(ticketing.getMycouponKey());
    					// 5. 예매 후 쿠폰 사용 여부를 DB mycoupon 테이블에서 수정
    					couponRow = couponService.modifyMycoupon(mycoupon);
    					if(couponRow != 0) {
	    					msg = "예매가 완료되었습니다.";
	    					model.addAttribute("msg", msg);
    					} else {
    						msg = "쿠폰 사용 정보 수정에 실패하였습니다.";
	    					model.addAttribute("msg", msg);
    					}
    				} else {
    					msg = "회원 정보의 포인트 수정이 실패하였습니다.";
    					model.addAttribute("msg", msg);
    				}
    			} else {
    				msg = "포인트 사용 내역 저장에 실패하였습니다.";
					model.addAttribute("msg", msg);
    			}
    		} else {
    			msg = "예매된 좌석 저장에 실패하였습니다.";
				model.addAttribute("msg", msg);
    		}
    	} else {
    		msg = "예매 내역 저장에 실패하였습니다.";
			model.addAttribute("msg", msg);
    	}
    	
    	return "/customer/ticketing/kakaopaySuccess";
    }
}
