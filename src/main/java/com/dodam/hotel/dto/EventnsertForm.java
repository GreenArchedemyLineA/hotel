package com.dodam.hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data                                                                                    
public class EventnsertForm {
	
	private Integer id;
	private String category;
	private Date startDate;
	private Date endDate;
	private String title;
	private String content;
	
}
