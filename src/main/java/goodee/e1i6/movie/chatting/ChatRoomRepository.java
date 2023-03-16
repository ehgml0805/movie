package goodee.e1i6.movie.chatting;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomRepository {

    private Map<String, ChatRoomDTO> chatRoomDTOMap;

    @PostConstruct
    private void init() {
        chatRoomDTOMap = new LinkedHashMap<>();
    }
    // 채팅방 리스트
    public List<ChatRoomDTO> findAllRooms() {
        //채팅방 생성 순서 최근 순으로 반환
        List<ChatRoomDTO> result = new ArrayList<>(chatRoomDTOMap.values());
        Collections.reverse(result); // 리스트의 순서를 거꾸로 뒤집는다

        return result;
    }
    // 채팅방 아이디 조회
    public ChatRoomDTO findRoomById(String id) {
        return chatRoomDTOMap.get(id);
    }
    // 채팅방 개설
    public ChatRoomDTO createChatRoomDTO(String name) {
        ChatRoomDTO room = ChatRoomDTO.create(name);
        chatRoomDTOMap.put(room.getRoomId(), room);

        return room;
    }
}
