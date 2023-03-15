package goodee.e1i6.movie.chatting;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chatting")
@Slf4j
public class RoomController {

    private final ChatRoomRepository repository;

    //채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public ModelAndView rooms(HttpSession session) {
    	
        log.debug(TeamColor.YIB + "채팅방 목록");
        ModelAndView mv = new ModelAndView();
        //if(session.getAttribute("loginCustomer") == null) {
        //	mv.setViewName("login/loginCustomer");
        //	return mv;
        //}
        if(session.getAttribute("loginCustomer") != null) {
        	Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        	mv.addObject("list", repository.findAllRooms());
        	mv.addObject("id", loginCustomer.getCustomerId());
        	mv.setViewName("customer/chatting/rooms");
            return mv;
        }
        mv.addObject("list", repository.findAllRooms());
        mv.addObject("id", "admin");
        mv.setViewName("employee/chatting/rooms");
        return mv;
        /*
        ModelAndView mv = new ModelAndView("customer/chatting/rooms");

        mv.addObject("list", repository.findAllRooms());
        mv.addObject("id", loginCustomer.getCustomerId());
        
        return mv;
        */
    }

    //채팅방 개설
    @PostMapping(value = "/room")
    public String create(@RequestParam String name, RedirectAttributes re) {

        log.debug(TeamColor.YIB + "채팅방 생성 , name: " + name);
        re.addFlashAttribute("roomName", repository.createChatRoomDTO(name));
        return "redirect:/chatting/rooms";
    }

    //채팅방 조회
    @GetMapping("/room")
    public String getRoom(String roomId, Model model, HttpSession session) {

        log.debug(TeamColor.YIB + "채팅방 입장, roomId : " + roomId);
        if(session.getAttribute("loginCustomer") != null) {
        	Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        	model.addAttribute("room", repository.findRoomById(roomId));
            model.addAttribute("loginId", loginCustomer.getCustomerId());
            return "customer/chatting/room";
        }
        model.addAttribute("room", repository.findRoomById(roomId));
        model.addAttribute("loginId", "admin");
        return "customer/chatting/room";
    }
}
