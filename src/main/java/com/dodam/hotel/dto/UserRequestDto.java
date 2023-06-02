package com.dodam.hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UserRequestDto {

	// 로그인 requestDto
	@Data
	public static class LoginFormDto {
		private String email;
		private String password;
	}
	
	// 정보수정 용도
	@Data
	public static class MyPageFormDto {
		private String email;
		private String password;
		private String name;
		private String gender;
		private Date birth;
		private String tel;
		private String address;
		private String detailAddress;
		private String originEmail;
	}
	
	// todo
	// 클래스 이름 수정 
	@Data
	public static class InsertDto {
		private Integer id;
		private String email;
		private String password;
		private String name;
		private String gender;
		private Date birth;
		private String tel;
		private String address;
		private String detailAddress;
		private Boolean socialLogin;
		
	}
	
	// 비밀번호 변경
	@Data
	public static class UpdatePwdDto {
		private String currentPwd;
		private String changePwd;
		private String checkChangePwd;
	}

}
