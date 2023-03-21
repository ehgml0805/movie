package goodee.e1i6.movie.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.e1i6.movie.service.VisitorService;
import goodee.e1i6.movie.teamColor.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StatisticsController {
	@Autowired VisitorService visitorService;
	// 년도별 통계 리스트
	@GetMapping("/employee/statistics/yearVisitorList")
	public String yearVisitorList (Model model) {
	    int year = LocalDate.now().getYear();
	    List<Map<String, Object>> yearVisitorList = visitorService.getYearVisitorCount(year);
	    log.debug(TeamColor.JSM + yearVisitorList +" <- yearVisitorList");
	    model.addAttribute("yearVisitorList", yearVisitorList);
	    return "employee/statistics/yearVisitorList";
	}
	
	// 월별 통계 리스트
	@GetMapping("/employee/statistics/monthVisitorList")
	public String monthVisitorList (@RequestParam(required = false) Integer year, Model model) {

		if (year == null) {
			year = LocalDate.now().getYear();
		}
	 
		List<Map<String,Object>> monthVisitorList = visitorService.getMonthlyVisitorCount(year);
		
		model.addAttribute("year", year);
		model.addAttribute("monthVisitorList", monthVisitorList);
		return "employee/statistics/monthVisitorList";
	}
	
}
