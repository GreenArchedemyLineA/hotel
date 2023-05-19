package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.ReservationRequestDto;

@Mapper
public interface ReservationRepository {
	
	// 다이닝 예약 (성희)
	public int insertReserveDining(ReservationRequestDto reservationRequestDto);
	
	// 객실 예약 (성희)
	public int insertReserveRoom(ReservationRequestDto reservationRequestDto);
	
}
