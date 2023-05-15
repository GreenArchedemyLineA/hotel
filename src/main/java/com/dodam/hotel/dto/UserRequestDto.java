package com.dodam.hotel.dto;

import java.sql.Date;

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
		private Date birth;
		private String tel;
	}
	
	@Data
	public static class insertDto {
		private Integer id;
		private String email;
		private String password;
		private String name;
		private String gender;
		private Date birth;
		private String tel;
	}

}
