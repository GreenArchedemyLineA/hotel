package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Package {
	
	private Integer id;
	private String name;
	private Integer price;
	private Room room;
	private Dining dining;
	private Spa spa;
	private Pool pool;
	private Fitness fitness;
	
} // end of class


