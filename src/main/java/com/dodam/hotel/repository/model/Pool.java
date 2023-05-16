package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Pool {

	private Integer id;
	private String hours;
	private Boolean availability;
	private String status_desc;
	private Facilities facilities;
	private FacilitiesDesc facilitiesDesc;
}
