package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.User;

@Mapper
public interface UserRepository {
	

	// 로그인용 select
	public UserResponseDto.LoginResponseDto findUserByLoginFormDto(UserRequestDto.LoginFormDto user);

	// update용
	public int updateUserByEmail(UserRequestDto.MyPageFormDto user);
	
	// 특정 유저 정보 찾기
	public User findUserByEmail(String email);
	
	// 회원가입
	public int insert(UserRequestDto.insertDto insertDto);
	
	// 제일 최근 가입 회원 ID 찾기
	public Integer findIdOrderById(UserRequestDto.insertDto insertDto);
	
	// 회원가입 시 등급 부여
	public int insertGrade(Integer id);
}