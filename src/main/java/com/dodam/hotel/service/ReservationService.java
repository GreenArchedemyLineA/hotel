package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.interfaces.ReservationRepository;

@Service
public class ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;

	// 다이닝 예약
	public int createReserveDining(ReservationRequestDto reservationRequestDto, Integer userId) {
		reservationRequestDto.setUserId(userId);
		reservationRequestDto.setStartDate(reservationRequestDto.getDate());
		reservationRequestDto.setEndDate(reservationRequestDto.getDate());
		reservationRequestDto.setDiningId(1);
		int numberOfP = reservationRequestDto.getCountPerson() + reservationRequestDto.getCountChild()
				+ reservationRequestDto.getCountBaby();
		reservationRequestDto.setNumberOfP(numberOfP);
		int resultRowCount = reservationRepository.insertReserveDining(reservationRequestDto);
		return resultRowCount;
	}

	// 객실 예약
	public int createReserveRoom(ReservationRequestDto reservationRequestDto, Integer userId) {
		// 부대시설 추가 신청 여부 처리
		if (reservationRequestDto.getDiningCount() != 0) {
			reservationRequestDto.setDiningId(1);
		}
		if (reservationRequestDto.getSpaCount() != 0) {
			reservationRequestDto.setSpaId(1);
		}
		if (reservationRequestDto.getPoolCount() != 0) {
			reservationRequestDto.setPoolId(1);
		}
		if (reservationRequestDto.getFitnessCount() != 0) {
			reservationRequestDto.setFitnessId(1);
		}
		reservationRequestDto.setRoomId(1);
		reservationRequestDto.setUserId(userId);
		System.out.println(reservationRequestDto);
		int resultRowCount = reservationRepository.insertReserveRoom(reservationRequestDto);
		return resultRowCount;
	}

}
