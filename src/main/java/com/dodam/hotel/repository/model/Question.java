package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import com.dodam.hotel.enums.QuestionCategory;

import lombok.Data;

/**
 * 
 * @author 김현우
 *
 */

@Data
public class Question {
	
	private Integer id;
	private String title;
	private String content;
	private User user;
	private Timestamp createdAt;
	private QuestionCategory category;
	private String file;
	private Boolean status;
	
} // end of class
