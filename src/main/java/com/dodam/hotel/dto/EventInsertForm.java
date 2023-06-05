package com.dodam.hotel.dto;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data                                                                                    
public class EventInsertForm {
	
	private Integer id;
	private String category;
	private Date startDate;
	private Date endDate;
	@NotBlank(message = "제목을 입력해주세요.")
	private String title;
	@NotBlank(message = "내용을 입력해주세요.")
	private String content;
	
}
