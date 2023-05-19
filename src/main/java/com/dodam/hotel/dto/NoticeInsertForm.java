package com.dodam.hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data                                                                                    
public class NoticeInsertForm {
	
	private Date startDate;
	private Date endDate;
	private String title;
	private String content;
	
}
