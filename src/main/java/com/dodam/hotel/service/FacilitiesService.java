package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.FacilitiesDto;
import com.dodam.hotel.repository.interfaces.FacilitiesRepository;
import com.dodam.hotel.repository.model.Fitness;
import com.dodam.hotel.repository.model.Pool;
import com.dodam.hotel.repository.model.Spa;
/**
 * 
 * @author 성희
 * 부대시설 서비스
 */
@Service
public class FacilitiesService {
	
	@Autowired
	private FacilitiesRepository facilitiesRepository;
	
	/**
	 * 
	 * @return 수영장 조회 서비스
	 */
	public Pool readPoolAll() {
		Pool pool = facilitiesRepository.findPool();
		return pool;
	}
	
	/**
	 * 
	 * @return 스파 조회 서비스
	 */
	public Spa readSpaAll() {
		Spa spa = facilitiesRepository.findSpa();
		return spa;
	}
	
	/**
	 * 
	 * @return 피트니스 조회 서비스
	 */
	public Fitness readFitnessAll() {
		Fitness fitness = facilitiesRepository.findFitness();
		return fitness;
	}
}
