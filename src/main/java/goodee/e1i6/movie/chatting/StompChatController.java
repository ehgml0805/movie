package goodee.e1i6.movie.chatting;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

    private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

    //Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    // 채팅방 입장시
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageDTO message) {
        if(message.getWriter().equals("admin")) {
        	message.setMessage("상담원이 입장하였습니다.");
        } else {
        	message.setMessage(message.getWriter() + "님 잠시만 기다려 주세요.");
        }
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageDTO message) {
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
}
