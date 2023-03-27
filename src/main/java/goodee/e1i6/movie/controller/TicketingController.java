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
import goodee.e1i6.movie.service.MovieService;
import goodee.e1i6.movie.service.ScreeningScheduleService;
import goodee.e1i6.movie.service.SeatService;
import goodee.e1i6.movie.service.StillCutService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Seat;
import goodee.e1i6.movie.vo.StillCut;
import goodee.e1i6.movie.vo.Ticketing;

@Controller
public class TicketingController {
	@Autowired MovieService movieService;
	@Autowired TheaterService theaterService;
	@Autowired ScreeningScheduleService screeningScheduleService;
	@Autowired StillCutService stillCutService;
	@Autowired SeatService seatService;
	@Autowired CouponService couponService;
	
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
	
	
}
