package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.DiningDesc;

@Mapper
public interface DiningRepository {
	
	public List<DiningDesc> findAllDining(String type);
	
} // end of class
