package com.dodam.hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.enums.CouponInfo;
import com.dodam.hotel.enums.Grade;
import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.interfaces.GradeRepository;
import com.dodam.hotel.repository.interfaces.PointRepository;
import com.dodam.hotel.repository.interfaces.ReservationRepository;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.Point;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.util.PagingObj;

@Service
public class ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;

	@Autowired
	private PointRepository pointRepository;

	@Autowired
	private CouponRepository couponRepository;
	
	private int count;
	
	@Autowired
	private GradeRepository gradeRepository;

	// 특정 유저의 모든 예약 정보 출력
	@Transactional
	public List<Reservation> readAllReservationByUserId(Integer userId) {
		List<Reservation> reservationEntitys = reservationRepository.findAllReservationByUserId(userId);
		return reservationEntitys;
	}
	
	// 특정 유저 모든 예약 정보 카운트
	@Transactional
	public int readAllReservationByUserIdCount(Integer userId) {
		int resultCount = reservationRepository.findAllReservationByUserIdCount(userId);
		return resultCount;
	}
	
	// 특정 유저 모든 예약 정보 페이징
	public List<Reservation> readAllResrevationByUserIdPaging(PagingObj obj, Integer userId) {
		List<Reservation> reservationEntitys = reservationRepository.findAllReservationByUserIdPaging(obj, userId);
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
	@Transactional
	public Map<String, Object> useCouponOrPoint(ReservationRequestDto reservationRequestDto) {
		// 사용 가능 쿠폰 조회
		List<Coupon> couponList = couponRepository.findByUserId(reservationRequestDto.getUserId());
		
		// 포인트 조회
		Point point = pointRepository.findByUserId(reservationRequestDto.getUserId());
		
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
		List<Reservation> responseEntitys = readAllReservationByUserId(userId);
		// 해당 회원 현재 등급 조회
		GradeInfo userGrade = gradeRepository.findGradeByUserId(userId);
		// 해당 회원의 모든 예약 정보 불러와서 날짜 계산하기
		count = 0;
		
		responseEntitys.forEach(res -> {
			Long startDate = res.getStartDate().getTime();
			Long endDate = res.getEndDate().getTime();
			Long dayCount = ((endDate - startDate) / 1000) / (24*60*60);
			count += dayCount.intValue();
		});
		
		int resultRowCount = reservationRepository.insertReserveRoom(reservationRequestDto);
		Integer nowReservationCount = reservationRequestDto.getDay();
		count += nowReservationCount;
		if(resultRowCount != 1) {
			// 예외 처리
		} else {
			if(count >= 5 && userGrade.getGrade().getId() < 3) {
				// 골드 등급업 처리
				gradeRepository.updateUserGrade(userId, Grade.DIA);
				// 쿠폰 부여
				couponRepository.insert(CouponInfo.DIA , userId);
				couponRepository.insert(CouponInfo.DIA2 , userId);
				System.out.println("다이아 등급업 !!!");
			} else if (count >= 2 && userGrade.getGrade().getId() < 2) {
				// 다이아 등급업 처리
				gradeRepository.updateUserGrade(userId, Grade.GOLD);
				// 쿠폰 부여
				couponRepository.insert(CouponInfo.GOLD , userId);
				System.out.println("골드 등급업 !!!");
				
			}
		}
		
		// 방 상태 바꾸기
		

		return resultRowCount;
	}

}
