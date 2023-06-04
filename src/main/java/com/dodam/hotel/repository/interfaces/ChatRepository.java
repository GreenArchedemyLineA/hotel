package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.enums.ChatRole;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRepository {
    int insertChat(Integer targetUserId, String msg, ChatRole role);
}
