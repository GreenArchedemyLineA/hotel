package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.UserRequestDto;

@Mapper
public interface UserRepository {
	
	// 회원가입
	public int insert(UserRequestDto.insertDto insertDto);
}
