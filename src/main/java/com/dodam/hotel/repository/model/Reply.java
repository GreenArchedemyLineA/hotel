package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Reply {
	
	private Integer Id;
	private String content;
	private Question question;
	private Manager manager;
	
} // end of class
