package com.dodam.hotel.handler;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.dto.socket.SocketMessageDto;
import com.dodam.hotel.util.Define;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.servlet.http.HttpSession;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class SocketHandler extends TextWebSocketHandler {
    private final Set<WebSocketSession> socketSessions = ConcurrentHashMap.newKeySet();

    private Set<WebSocketSession> managerSessions = ConcurrentHashMap.newKeySet();
    private Set<WebSocketSession> userSessions = ConcurrentHashMap.newKeySet();
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        UserResponseDto.LoginResponseDto user = (UserResponseDto.LoginResponseDto) session.getAttributes().get(Define.PRINCIPAL);
        socketSessions.add(session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        System.out.println(payload);
        ObjectMapper objectMapper = new ObjectMapper();
        SocketMessageDto msg = objectMapper.readValue(payload, SocketMessageDto.class);

        System.out.println(msg);
    }
}
