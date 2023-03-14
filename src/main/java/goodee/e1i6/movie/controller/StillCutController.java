package goodee.e1i6.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.service.StillCutService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.StillCut;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StillCutController {
	@Autowired StillCutService stillCutService;
	
	// 스틸컷 개별 삭제
	@GetMapping("/employee/stillCut/removeStillCut")
	public String removeStillCut(@RequestParam(value="stillCutKey", required = true) int stillCutKey
								, @RequestParam(value="movieKey", required = true) int movieKey) {
		stillCutService.removeStillCut(stillCutKey);
		return "redirect:/employee/movie/modifyMovie?movieKey="+movieKey;
	}
	
	// 스틸컷 개별 수정
	@GetMapping("/employee/stillCut/modifyStillCut")
	public String modifyStillCut(Model model
				, @RequestParam(value="stillCutKey", required = true) int stillCutKey) {
		log.debug(TeamColor.JYW + "modfiyStillCut");
		
		StillCut stillCut = stillCutService.getStillCutOne(stillCutKey);
		model.addAttribute("stillCut", stillCut);
		
		return "/employee/stillCut/modifyStillCut";
	}
	@PostMapping("/employee/stillCut/modifyStillCut")
	public String modifyStillCut(Model model, HttpServletRequest request, MultipartFile image, StillCut stillCut) {
		log.debug(TeamColor.JYW + "modifyStillCut Action");
		
		String path = request.getServletContext().getRealPath("/stillCut-upload/");
		
		int row = stillCutService.modifyStillCut(image, path, stillCut);
		// row != 0 이면 수정성공
		if(row == 0) {
			model.addAttribute("msg", "수정실패하였습니다.");
			log.debug(TeamColor.JYW + "수정 실패");
			return "redirect:/employee/stillCut/modifyStillCut?stillCutKey="+stillCut.getStillCutKey();
		}
		return "redirect:/employee/stillCut/stillCutOne?stillCutKey="+stillCut.getStillCutKey();
	}
	
	// 스틸컷 개별 등록
	@GetMapping("/employee/stillCut/addStillCut")
	public String addStillCut(Model model, int movieKey) {
		model.addAttribute("movieKey", movieKey);
		
		return "/employee/stillCut/addStillCut";
	}
	@PostMapping("/employee/stillCut/addStillCut")
	public String addStillCut(Model model, HttpServletRequest request, List<MultipartFile> files, int movieKey) {
		String path = request.getServletContext().getRealPath("/stillCut-upload/");
		log.debug(TeamColor.JYW + "StillCutController.addStillCut path : " + path);
		
		log.debug(TeamColor.JYW + "StillCutController.addStillCut files : " + files);
		
		int row = stillCutService.insertStillCut(files, path, movieKey);
		// row != 0 이면 입력성공
		if(row == 0) {
			model.addAttribute("msg", "등록실패하였습니다.");
			return "/employee/stillCut/addStillCut?movieKey="+movieKey;
		}
		
		return "redirect:/employee/movie/modifyMovie?movieKey="+movieKey;
	}
	
	// 스틸컷 상세정보 출력
	@GetMapping("/employee/stillCut/stillCutOne")
	public String getStillCutOne(Model model
				, @RequestParam(value="stillCutKey", required = true) int stillCutKey) {
	log.debug(TeamColor.JYW + "stillCutOne");
	
	StillCut stillCut = stillCutService.getStillCutOne(stillCutKey);
	model.addAttribute("stillCut", stillCut);
	
	int movieKey = stillCut.getMovieKey();
	model.addAttribute("movieKey", movieKey);
	
	return "/employee/stillCut/stillCutOne";
	}
}
