package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TestQuestion {
	
	private Integer id;
	private String title;
	private String content;
	private Integer userId;
	private Timestamp createdAt;
	private String category;
	private String originFile;
	private String uploadFile;
	private Boolean status;

}
