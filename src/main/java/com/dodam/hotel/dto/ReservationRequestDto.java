package com.dodam.hotel.dto;

import lombok.Data;

@Data
public class ReservationRequestDto {
	
	private String startDate;
	private String endDate;
	private String date;
	private Integer numberOfP;
	private Integer countPerson;
	private Integer countChild;
	private Integer countBaby;
	
}
