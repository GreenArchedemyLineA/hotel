package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Pool {

	private int id;
	private String hours;
	private boolean availability;
	private String status_desc;
	private Facilities facilities;
	private FacilitiesDesc facilitiesDesc;
}
