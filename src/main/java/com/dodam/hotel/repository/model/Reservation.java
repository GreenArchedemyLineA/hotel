package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Reservation {
	
	private Integer id;
	private String start_date;
	private String end_date;
	private Integer numberOfP;
	private Integer userId;
	private Integer roomId;
	private Integer diningId;
	private Integer packageId;
	private Integer fitnessId;
	private Integer poolId;
	private Integer spaId;
}
