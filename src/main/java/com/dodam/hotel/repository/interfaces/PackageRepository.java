package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.PackageDto;

@Mapper
public interface PackageRepository {
	
	public List<PackageDto> findAllPackage();
}
