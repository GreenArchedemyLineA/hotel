package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Coupon {
	
	private Integer id;
	private String name;
	private String content;
	private Integer userId;
	private String startDate;
	private String endDate;
}
