package com.dodam.hotel.dto;

import lombok.Data;

@Data
public class UserRequestDto {
	
	@Data
	public static class insertDto {
		private String email;
		private String password;
		private String name;
		private String gender;
		private String birth;
		private String tel;
	}
}
