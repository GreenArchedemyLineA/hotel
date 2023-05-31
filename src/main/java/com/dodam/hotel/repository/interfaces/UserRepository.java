package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.dto.InquiryRequestDto;
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
	
	// 카카오 회원가입
	public int insertKakao(UserRequestDto.insertDto insertDto);
	
	// 제일 최근 가입 회원 ID 찾기
	public Integer findIdOrderById(UserRequestDto.insertDto insertDto);
	
	// 회원 id 조회
	public User findUserForIdInquiry(InquiryRequestDto.IdInquiryRequestDto idInquiryRequestDto);
	
	// 임시 pw update 처리
	public int updatePwByUserInfo(InquiryRequestDto.PwInquiryRequestDto pwInquiryRequestDto);
	
	// 비밀번호 변경 페이지에서 비밀번호 변경 처리
	public int updateOnlyPw(@Param("password") String password, @Param("userId") Integer userId);
	
	// 임시 비밀번호 발급 상태 변경
	public int updatePwdStatus(Integer userId);
	
}
