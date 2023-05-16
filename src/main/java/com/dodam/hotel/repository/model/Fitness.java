package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Fitness {

	private int id;
	private String hours;
	private boolean availability;
	private String status_desc;
	private Facilities facilities;
	private FacilitiesDesc facilitiesDesc;
}
