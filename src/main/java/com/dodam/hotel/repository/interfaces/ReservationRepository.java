package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.ReservationRequestDto;

@Mapper
public interface ReservationRepository {
	
	public int insertReserveDining(ReservationRequestDto reservationRequestDto);
	
}
