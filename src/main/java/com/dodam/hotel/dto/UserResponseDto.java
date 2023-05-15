package com.dodam.hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UserResponseDto {
	
	@Data
	public static class LoginResponseDto {
		private String email;
		private String password;
	}
	
	@Data
	public static class MyPageResponseDto {
		private Integer id;
		private String email;
		private String password;
		private String name;
		private String gender;
		private Date birth;
		private String tel;
	}
	
} // end of class
