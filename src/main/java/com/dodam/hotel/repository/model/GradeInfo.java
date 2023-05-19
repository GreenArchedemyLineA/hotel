package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GradeInfo {
	
	private User user;
	private Grade grade;
	private Timestamp updatedAt;
	
} // end of class
