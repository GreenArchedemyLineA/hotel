package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class Package {

	private Integer id;
	private String name;
	private Room room;
	private Spa spa;
	private Pool pool;
	private Fitness fitness;
	private Integer price;
}
