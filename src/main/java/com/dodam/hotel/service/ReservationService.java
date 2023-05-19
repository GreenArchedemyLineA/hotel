package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.interfaces.ReservationRepository;
import com.dodam.hotel.repository.model.Reservation;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	// 다이닝 예약
	@Transactional
	public int createReserveDining(ReservationRequestDto reservationRequestDto) {
		int resultRowCount = reservationRepository.insertReserveDining(reservationRequestDto);
		return resultRowCount;
	}
	
	// 특정 유저의 모든 예약 정보 출력
	@Transactional
	public List<Reservation> readAllReservationByUserId(Integer userId) {
		List<Reservation> reservationEntitys = reservationRepository.findAllReservationByUserId(userId);
		return reservationEntitys;
	}
	
}
