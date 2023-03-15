package goodee.e1i6.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.e1i6.movie.service.ScreenroomService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Screenroom;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScreenroomController {
	@Autowired ScreenroomService screenroomService;
	
	// 상영관 상세 - 고객
	@GetMapping("/screenroom/screenroomOne")
	public String getScreenroomOneForCustomer(Model model, @RequestParam(value = "screenroomKey", defaultValue = "0") int screenroomKey) {
		log.debug(TeamColor.CHOI + "GET screenroomOne");
		
		Screenroom screenroomOne = screenroomService.getScreenroomOne(screenroomKey);
		if(screenroomOne == null) { 
			return "redirect:/customer/theater/theaterList";
		}
		model.addAttribute("screenroomOne", screenroomOne);
		
		return "/customer/screenroom/screenroomOne";
	}
	
	// 상영관 상세 - 관리자
	@GetMapping("/employee/screenroom/screenroomOne")
	public String getScreenroomOneForEmployee(Model model, @RequestParam(value = "screenroomKey", defaultValue = "0") int screenroomKey) {
		log.debug(TeamColor.CHOI + "GET screenroomOne");
		
		Screenroom screenroomOne = screenroomService.getScreenroomOne(screenroomKey);
		if(screenroomOne == null) { 
			return "redirect:/employee/theater/theaterList";
		}
		model.addAttribute("screenroomOne", screenroomOne);
		
		return "/employee/screenroom/screenroomOne";
	}
	
	// 상영관 삭제
	@GetMapping("/employee/screenroom/removeScreenroom")
	public String removeScreenroom(@RequestParam(value = "screenroomKey", defaultValue = "0") int screenroomKey, RedirectAttributes ra) { 
		log.debug(TeamColor.CHOI + "GET removeScreenroom");
		
		int row = screenroomService.removeScreenroom(screenroomKey);
		
		if(row == 1) {
			log.debug(TeamColor.CHOI + "상영관 삭제 성공");
			ra.addFlashAttribute("msg", "REMOVE_SUCCESS");
		} else if(row == 0){
			log.debug(TeamColor.CHOI + "상영관 삭제 실패");
			ra.addFlashAttribute("msg", "REMOVE_ERROR");
		} else if(row == -1) {
			log.debug(TeamColor.CHOI + "상영관 삭제 실패 (참조키 존재)");
			ra.addFlashAttribute("msg", "REMOVE_DUP");
		}
		
		return "redirect:/employee/screenroom/screenroomOne?screenroomKey="+screenroomKey;
	}
	
	// 상영관 수정
	@PostMapping("/employee/screenroom/modifyScreenroom")
	public String modifyTheater(@ModelAttribute Screenroom screenroom, RedirectAttributes ra) {
		log.debug(TeamColor.CHOI + "POST modifyScreenroom");
		
		int row = screenroomService.modifyScreenroom(screenroom);
		
		if(row == 1) {
			log.debug(TeamColor.CHOI + "상영관 수정 성공");
			ra.addFlashAttribute("msg", "MODIFY_SUCCESS");
		} else {
			log.debug(TeamColor.CHOI + "상영관 수정 실패");
			ra.addFlashAttribute("msg", "MODIFY_ERROR");
		}
		
		return "redirect:/employee/screenroom/screenroomOne?screenroomKey="+screenroom.getScreenroomKey();
	}
		
	// 상영관 등록
	@GetMapping("/employee/screenroom/addScreenroom")
	public String addScreenroom(@RequestParam(value = "theaterKey", defaultValue = "0") int theaterKey, Model model) {
		log.debug(TeamColor.CHOI + "GET addScreenroom");
		model.addAttribute("theaterKey", theaterKey);
		
		return "/employee/screenroom/addScreenroom";
	}
	
	@PostMapping("/employee/screenroom/addScreenroom")
	public String addScreenroom(@ModelAttribute Screenroom screenroom, RedirectAttributes ra) {
		log.debug(TeamColor.CHOI + "POST addScreenroom");
		
		int row = screenroomService.addScreenroom(screenroom);
		
		if(row == 1) {
			log.debug(TeamColor.CHOI + "상영관 등록 성공");
			ra.addFlashAttribute("msg", "ADD_SUCCESS");
		} else {
			log.debug(TeamColor.CHOI + "상영관 등록 실패");
			ra.addFlashAttribute("msg", "ADD_ERROR");
		}

		return "redirect:/employee/theater/theaterOne?theaterKey="+screenroom.getTheaterKey();
	}
}
