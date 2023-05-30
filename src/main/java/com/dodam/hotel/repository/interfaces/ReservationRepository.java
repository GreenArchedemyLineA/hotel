package com.dodam.hotel.repository.interfaces;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.DiningReservation;
import com.dodam.hotel.util.PagingObj;

@Mapper
public interface ReservationRepository {
	
	// 다이닝 예약 (성희)
	public int insertReserveDining(ReservationRequestDto reservationRequestDto);
	
	// 특정 유저의 전체 예약 조회
	public List<Reservation> findAllReservationByUserId(@Param("userId") Integer userId);
	
	// 특정 유저의 전체 예약 수 조회
	public int findAllReservationByUserIdCount(Integer UserId);

	// 특정 유저 전체 예약 조회(페이징, findAll---과 따로 쓰임)
	public List<Reservation> findAllReservationByUserIdPaging(@Param("obj") PagingObj obj, @Param("userId") Integer userId);
	
	// 객실 예약 (성희)
	public int insertReserveRoom(ReservationRequestDto reservationRequestDto);
	
	List<Reservation> findReservationByUserId(Integer userId);
    List<Reservation> findAllReservation();
    int updateReservation(Reservation reservation);
    int deleteReservation(Integer id);

    Reservation findReservationById(Integer id);

	List<DiningReservation> reservationFindDining(Date date);
}