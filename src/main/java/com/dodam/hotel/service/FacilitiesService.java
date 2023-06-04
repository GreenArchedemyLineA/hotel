package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.FacilitiesDto;
import com.dodam.hotel.repository.interfaces.FacilitiesRepository;
import com.dodam.hotel.repository.model.AllFacilities;
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
	@Transactional
	public Pool readPoolAll() {
		Pool pool = facilitiesRepository.findPool();
		return pool;
	}
	
	/**
	 * 
	 * @return 스파 조회 서비스
	 */
	@Transactional
	public Spa readSpaAll() {
		Spa spa = facilitiesRepository.findSpa();
		return spa;
	}
	
	/**
	 * 
	 * @return 피트니스 조회 서비스
	 */
	@Transactional
	public Fitness readFitnessAll() {
		Fitness fitness = facilitiesRepository.findFitness();
		return fitness;
	}
	
	// 부대시설 상태 조회
	@Transactional
	public int readPoolStatus() {
		int resultRowCount = facilitiesRepository.findPoolStatus();
		return resultRowCount;
	}
	@Transactional
	public int readSpaStatus() {
		int resultRowCount = facilitiesRepository.findSpaStatus();
		return resultRowCount;
	}
	@Transactional
	public int readFitnessStatus() {
		int resultRowCount = facilitiesRepository.findFitnessStatus();
		return resultRowCount;
	}
	
	// 부대시설 전체 조회
	@Transactional
	public List<AllFacilities> readAllFacilities() {
		List<AllFacilities> facilitiesList = facilitiesRepository.findAllFacilities();
		return facilitiesList;
	}
}
