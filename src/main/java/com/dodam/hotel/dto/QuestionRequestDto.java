package com.dodam.hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuestionRequestDto {
	
	// 문의 등록 dto
	@Data
	public static class InsertQuestionRequestDto {
		
		private String title;
		private String content;
		private Integer userId;
		private String category;
		private MultipartFile file;
		private String uploadFile;
		private String originFile;
		
	}
	
}
