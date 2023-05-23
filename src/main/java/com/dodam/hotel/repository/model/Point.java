package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Point {
	private Integer id;
	private Integer point;
	private User user;
	private String endDate;
}
