package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Reservation {
	
	private Integer id;
	private String startDate;
	private String endDate;
	private Integer numberOfP;
	private Timestamp createdAt;
	private Integer totalPrice;
	private User user;
	private Room room;
	private Dining dining;
	private Package h_package;
	private Fitness fitness;
	private Pool pool;
	private Spa spa;
}
