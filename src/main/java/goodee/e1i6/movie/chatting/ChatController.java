package goodee.e1i6.movie.chatting;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ChatController {
	
	@GetMapping("/chat")
	public String chatGET() {
		log.debug("@ChatController, chat GET()");
		
		return "chat";
	}
}
