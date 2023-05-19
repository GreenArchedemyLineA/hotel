package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.repository.interfaces.DiningRepository;
import com.dodam.hotel.repository.model.DiningDesc;

@Service
public class DiningService {
	
	@Autowired
	private DiningRepository diningRepository;
	
	@Transactional
	public List<DiningDesc> readAllDining(String type) {
		List<DiningDesc> diningDescEntitiys = diningRepository.findByTypeAllDining(type);
		return diningDescEntitiys;
	}
	
	
} // end of class
