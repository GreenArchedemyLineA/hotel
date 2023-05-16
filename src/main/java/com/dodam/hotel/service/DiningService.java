package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.repository.interfaces.DiningRepository;
import com.dodam.hotel.repository.model.DiningDesc;

@Service
public class DiningService {
	
	@Autowired
	private DiningRepository diningRepository;
	
	public List<DiningDesc> readAllDining(String type) {
		List<DiningDesc> diningDescEntitiys = diningRepository.findAllDining(type);
		return diningDescEntitiys;
	}
	
	
} // end of class
