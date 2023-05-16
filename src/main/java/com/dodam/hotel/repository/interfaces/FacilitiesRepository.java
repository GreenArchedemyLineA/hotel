package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.FacilitiesDto;
import com.dodam.hotel.repository.model.Fitness;
import com.dodam.hotel.repository.model.Pool;
import com.dodam.hotel.repository.model.Spa;

/**
 * 
 * @author 성희 부대시설 repository
 */
@Mapper
public interface FacilitiesRepository {

	// 수영장 정보 조회
	public Pool findPool();

	// 스파 정보 조회
	public Spa findSpa();

	// 피트니스 정보 조회
	public Fitness findFitness();
}
