package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class TestReply {
	
	private Integer id;
	private String content;
	private Integer questionId;
	private Integer managerId;
	
}
