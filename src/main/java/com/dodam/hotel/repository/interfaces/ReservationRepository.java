package com.dodam.hotel.repository.interfaces;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.model.Reservation;

@Mapper
public interface ReservationRepository {
	
	// 다이닝 예약 (성희)
	public int insertReserveDining(ReservationRequestDto reservationRequestDto);
	

	// 특정 유저의 전체 예약 조회
	public List<Reservation> findAllReservationByUserId(Integer userId);

	// 객실 예약 (성희)
	public int insertReserveRoom(ReservationRequestDto reservationRequestDto);

	
}
