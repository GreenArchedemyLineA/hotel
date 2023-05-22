package com.dodam.hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.interfaces.PointRepository;
import com.dodam.hotel.repository.interfaces.ReservationRepository;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.repository.model.Point;
import com.dodam.hotel.repository.model.Reservation;

@Service
public class ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;

	@Autowired
	private PointRepository pointRepository;

	@Autowired
	private CouponRepository couponRepository;

	// 특정 유저의 모든 예약 정보 출력
	@Transactional
	public List<Reservation> readAllReservationByUserId(Integer userId) {
		List<Reservation> reservationEntitys = reservationRepository.findAllReservationByUserId(userId);
		return reservationEntitys;
	}

	// 다이닝 예약
	@Transactional
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

	// 객실 할인 체크
	public Map<String, Object> useCouponOrPoint(Integer userId) {
		// 사용 가능 쿠폰 조회
		List<Coupon> couponList = couponRepository.findByUserId(userId);
		for (int i = 0; i < couponList.size(); i++) {
			System.out.println(couponList.get(i));
			
		}
		
		// 포인트 조회
		Point point = pointRepository.findByUserId(userId);
		Map<String, Object> selectList = new HashMap<>();
		selectList.put("point", point);
		selectList.put("couponList", couponList);
		return selectList;
	}

	// 객실 예약
	@Transactional
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
		reservationRequestDto.setUserId(userId);
		System.out.println(reservationRequestDto);
		int resultRowCount = reservationRepository.insertReserveRoom(reservationRequestDto);

		return resultRowCount;
	}

}
