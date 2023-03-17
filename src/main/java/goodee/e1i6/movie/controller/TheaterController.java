package goodee.e1i6.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.e1i6.movie.service.ScreenroomService;
import goodee.e1i6.movie.service.TheaterService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Postcode;
import goodee.e1i6.movie.vo.Screenroom;
import goodee.e1i6.movie.vo.Theater;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TheaterController {
	@Autowired TheaterService theaterService;
	@Autowired ScreenroomService screenroomService;
	
	// 극장 출력(이름순) - 고객
	@GetMapping("/theater/theaterList")
	public String getTheaterListForCustomer(Model model) {
		log.debug(TeamColor.CHOI + "GET theaterList");
		
		List<Theater> theaterList = theaterService.getTheaterList();
		model.addAttribute("theaterList", theaterList);
		
		return "/customer/theater/theaterList";
	}
	
	// 극장 상세 정보 - 고객
	@GetMapping("/theater/theaterOne")
	public String getTheaterOneForCustomer(Model model, @RequestParam(value = "theaterKey", defaultValue = "0") int theaterKey) {
		log.debug(TeamColor.CHOI + "GET theaterOne");
		
		if(theaterKey == 0) {
			return "redirect:/employee/theater/theaterList";
		}
		
		Theater theaterOne = theaterService.getTheaterOne(theaterKey);
		List<Screenroom> screenroomList = screenroomService.getScreenroomList(theaterKey); // 상영관 목록(이름순)
		
		model.addAttribute("screenroomList", screenroomList);
		model.addAttribute("theaterOne", theaterOne);
		
		return "/customer/theater/theaterOne";
	}
	
	// 극장 출력(이름순) - 관리자
	@GetMapping("/employee/theater/theaterList")
	public String getTheaterListForEmployee(Model model) {
		log.debug(TeamColor.CHOI + "GET theaterList");
		
		List<Theater> theaterList = theaterService.getTheaterList();
		model.addAttribute("theaterList", theaterList);
		
		return "/employee/theater/theaterList";
	}
	
	// 극장 상세 정보 - 관리자
	@GetMapping("/employee/theater/theaterOne")
	public String getTheaterOneForEmployee(Model model, @RequestParam(value = "theaterKey", defaultValue = "0") int theaterKey) {
		log.debug(TeamColor.CHOI + "GET theaterOne");
		
		Theater theaterOne = theaterService.getTheaterOne(theaterKey);
		if(theaterOne == null) {
			return "redirect:/employee/theater/theaterList";
		}
		
		List<Screenroom> screenroomList = screenroomService.getScreenroomList(theaterKey); // 상영관 목록(이름순)
		
		model.addAttribute("screenroomList", screenroomList);
		model.addAttribute("theaterOne", theaterOne);
		
		return "/employee/theater/theaterOne";
	}
	
	// 극장 등록
	@GetMapping("/employee/theater/addTheater")
	public String addTheater() {
		log.debug(TeamColor.CHOI + "GET addTheater");
		return "/employee/theater/addTheater";
	}
	
	@PostMapping("/employee/theater/addTheater")
	public String addTheater(@ModelAttribute Theater theater
							, @ModelAttribute Postcode postCode, RedirectAttributes ra) {
		log.debug(TeamColor.CHOI + "POST addTheater");
		
		int row = theaterService.addTheater(theater, postCode);
		
		if(row == 1) {
			log.debug(TeamColor.CHOI + "극장 등록 성공");
			ra.addFlashAttribute("msg", "ADD_SUCCESS");
		} else {
			log.debug(TeamColor.CHOI + "극장 등록 실패");
			ra.addFlashAttribute("msg", "ADD_ERROR");
		}
		
		return "redirect:/employee/theater/theaterList";
	}
	
	// 극장 수정
	@PostMapping("/employee/theater/modifyTheater")
	public String modifyTheater(@ModelAttribute Theater theater
								, @ModelAttribute Postcode postCode, RedirectAttributes ra) {
		// log.debug(TeamColor.CHOI + theater.toString());
		
		int row = theaterService.modifyTheater(theater, postCode);
		
		if(row == 1) {
			log.debug(TeamColor.CHOI + "극장 수정 성공");
			ra.addFlashAttribute("msg", "MODIFY_SUCCESS");
		} else {
			log.debug(TeamColor.CHOI + "극장 수정 실패");
			ra.addFlashAttribute("msg", "MODIFY_ERROR");
		}
		
		return "redirect:/employee/theater/theaterOne?theaterKey="+theater.getTheaterKey();
	}
	
	// 극장 삭제
	@GetMapping("/employee/theater/removeTheater")
	public String removeTheater(@RequestParam(value = "theaterKey", defaultValue = "0") int theaterKey, RedirectAttributes ra) {
		log.debug(TeamColor.CHOI + "GET removeTheater");
		
		int row = theaterService.removeTheater(theaterKey);
			
		if(row == 1) {
			log.debug(TeamColor.CHOI + "극장 삭제 성공");
			ra.addFlashAttribute("msg", "REMOVE_SUCCESS");
		} else if(row == 0){
			log.debug(TeamColor.CHOI + "극장 삭제 실패");
			ra.addFlashAttribute("msg", "REMOVE_ERROR");
		} else if(row == -1) {
			log.debug(TeamColor.CHOI + "극장 삭제 실패 (참조키 존재)");
			ra.addFlashAttribute("msg", "REMOVE_DUP");
		}
		
		return "redirect:/employee/theater/theaterOne?theaterKey="+theaterKey;
	}
}
