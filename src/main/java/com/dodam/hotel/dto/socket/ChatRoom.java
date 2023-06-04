package com.dodam.hotel.dto.socket;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.util.Define;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.socket.WebSocketSession;

import java.util.UUID;

@Getter
public class ChatRoom {
    private String roomName;
    private WebSocketSession userSession;
    private WebSocketSession managerSession;

    public ChatRoom(WebSocketSession webSocketSession){
        this.roomName = ((UserResponseDto.LoginResponseDto) webSocketSession.getAttributes().get(Define.PRINCIPAL)).getName();
        this.userSession = webSocketSession;
    }

    public void setManagerSession(WebSocketSession managerSession) {
        this.managerSession = managerSession;
    }


}
