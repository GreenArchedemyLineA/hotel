package com.dodam.hotel.repository.model;

import lombok.Data;

@Data
public class RoomType {
	
	private Integer id;
	private String name;
	private Integer price;
	private String description;
	private String image;
	private Integer numberOfP;
	
} // end of class
