package goodee.e1i6.movie.chatting;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSoketConfig implements WebSocketConfigurer {
	   @Autowired
	   private final ChatHandler chatHandler;
	   
	   @Override
	   public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
	      registry.addHandler(chatHandler, "/ws/chat").setAllowedOrigins("*"); // .setAllowedOrigins("*")는 ws프로토콜 /ws/chat 하위의 모든 uri에서 chatHandler를 사용
	      //.addInterceptors(new HttpSessionHandshakeInterceptor());   // 핸드 쉐이크를 할 때, http의 session을 가져오기 위한 인터셉터를 추가하는 것
	   }
}
