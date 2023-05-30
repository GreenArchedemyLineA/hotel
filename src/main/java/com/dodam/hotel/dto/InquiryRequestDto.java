package com.dodam.hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class InquiryRequestDto {
	
	@Data
	public static class IdInquiryRequestDto {
		private String name;
		private Date birth;
		private String tel;
	}
	
	@Data
	public static class PwInquiryRequestDto {
		private String email;
		private String name;
		private Date birth;
		private String tel;
		private String password;
	}
	
	
} // end of class
