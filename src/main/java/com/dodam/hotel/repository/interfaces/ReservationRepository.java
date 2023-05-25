package com.dodam.hotel.repository.interfaces;

import java.sql.Date;
import java.util.List;


import com.dodam.hotel.repository.model.managertest.DiningReservation;
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
	
	List<Reservation> findReservationByUserId(Integer userId);
    List<Reservation> findAllReservation();
    int updateReservation(Reservation reservation);
    int deleteReservation(Integer id);

    Reservation findReservationById(Integer id);

	List<DiningReservation> reservationFindDining(Date date);
}