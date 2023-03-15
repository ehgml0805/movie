package goodee.e1i6.movie.chatting;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
@Configuration
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/stomp/chat")
                .setAllowedOrigins("http://localhost:80")
                .withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/pub");
        registry.enableSimpleBroker("/sub");
    }
}
	
	/* WebSocketConfig
    private final ChatHandler chatHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    
        registry.addHandler(chatHandler, "ws/chat")
	        .setAllowedOriginPatterns("http://*:80","http://*.*.*.*:80")
	        .withSockJS()
	        .setClientLibraryUrl("https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js");
	        }
	        //setAllowedOrigins("*")에서 *라는 와일드 카드를 사용하면
	        //보안상의 문제로 전체를 허용하는 것보다 직접 하나씩 지정해주어야 한다고 한다.
	        
	        Spring Boot에서 CORS 설정 시, .allowCredentials(true)와
	        .allowedOrigins("*")는 동시 설정을 못하도록 업데이트 되었다고 한다.
	        모든 주소를 허용하는 대신 특정 패턴만 허용하는 것으로 적용해야한다고 변동됨.
	        
	        .allowedOrigins("*") 대신 .allowedOriginPatterns("*")를 사용하면 에러는 해결이
	        된다고 한다.
	  */
	
    

