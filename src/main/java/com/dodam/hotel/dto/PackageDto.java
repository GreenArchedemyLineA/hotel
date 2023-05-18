package com.dodam.hotel.dto;

import lombok.Data;

@Data
public class PackageDto {
	
	private Integer id;
	private String name;
	private Integer roomId;
	private Integer spaId;
	private Integer poolId;
	private Integer fitnessId;
	private Integer price;
}
