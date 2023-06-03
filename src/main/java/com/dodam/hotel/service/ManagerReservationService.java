package com.dodam.hotel.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.handler.exception.ManagerCustomRestFullException;
import com.dodam.hotel.repository.interfaces.DiningRepository;
import com.dodam.hotel.repository.interfaces.MUserRepository;
import com.dodam.hotel.repository.interfaces.ReservationRepository;
import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.model.Dining;
import com.dodam.hotel.repository.model.DiningReservation;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.Room;

/**
 * @author lhs-devloper
 */
@Service
public class ManagerReservationService {
	@Autowired
	private ReservationRepository reservationRepository;
	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private MUserRepository mUserRepository;
	@Autowired
	private DiningRepository diningRepository;

	public List<Reservation> findTodayAllReservation() {
		List<Reservation> reservationList = reservationRepository.findAllReservation();
		return reservationList;
	}

	@Transactional
	public List<Reservation> findUserReservation(String name) {
		List<Reservation> reservationList = new ArrayList<>();
		List<MUser> userList = mUserRepository.findByname(name);
		System.out.println(userList);
		userList.stream().forEach((user) -> {
			List<Reservation> reservationUserList = reservationRepository.findReservationByUserId(user.getId());
			reservationUserList.forEach((reservation -> {
				reservationList.add(reservation);
			}));
		});

		return reservationList;
	}

	@Transactional
	public Map<String, Object> findReservationById(Integer id) {
		Map<String, Object> mapList = new HashMap<>();
		Reservation reservation = reservationRepository.findReservationById(id);
		List<Room> roomList = roomRepository.findAllRoomList();
		List<Dining> diningList = diningRepository.findAllDining();
		mapList.put("reservation", reservation);
		mapList.put("roomList", roomList);
		mapList.put("diningList", diningList);

		return mapList;
	}

	@Transactional
	public int updateReservation(Reservation reservation) {
		int result = reservationRepository.updateReservation(reservation);
		if(result == 0){
            // Exception Error
            throw new ManagerCustomRestFullException("예약 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
		return result;
	}

	@Transactional
	public int deleteReservation(Integer id) {
		int result = reservationRepository.deleteReservation(id);
		return result;
	}

	public List<DiningReservation> findDiningReservationAllList(Date date) {
		List<DiningReservation> diningReservationList = reservationRepository.reservationFindDining(date);
		return diningReservationList;
	}

	// 오늘 예약 매출 조회
	@Transactional
	public int readBeforeTodayTotalPrice() {
		int resultRowCount = reservationRepository.findTodayTotalPrice();
		return resultRowCount;
	}

	// 이전 예약 매출 조회
	@Transactional
	public Integer readBeforeTotalPrice(Integer count) {
		Integer resultRowCount = reservationRepository.findBeforeTotalPrice(count);
		return resultRowCount;
	}


}
