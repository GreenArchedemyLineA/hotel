package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.interfaces.ReservationRepository;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	public int createReserveDining(ReservationRequestDto reservationRequestDto) {
		int resultRowCount = reservationRepository.insertReserveDining(reservationRequestDto);
		return resultRowCount;
	}

	
}
