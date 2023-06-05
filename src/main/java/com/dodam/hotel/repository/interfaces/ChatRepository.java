package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.enums.ChatRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ChatRepository {
    int insertChat(@Param("targetUserId") Integer targetUserId, @Param("msg")String msg, @Param("role") ChatRole role);
}
