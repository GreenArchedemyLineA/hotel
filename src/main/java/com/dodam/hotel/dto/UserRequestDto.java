package com.dodam.hotel.dto;

import lombok.Data;

@Data
public class UserRequestDto {

	@Data
	public static class LoginFormDto {
		private String email;
		private String password;
	}

	@Data
	public static class MyPageFormDto {
		private String email;
		private String password;
		private String name;
		private String gender;
		private Integer birth;
		private String tel;
	}
	
	@Data
	public static class insertDto {
		private String email;
		private String password;
		private String name;
		private String gender;
		private Integer birth;
		private String tel;
	}

}
