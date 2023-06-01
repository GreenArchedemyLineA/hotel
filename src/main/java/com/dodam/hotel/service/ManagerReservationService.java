package com.dodam.hotel.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.repository.interfaces.DiningRepository;
import com.dodam.hotel.repository.interfaces.FitnessRepository;
import com.dodam.hotel.repository.interfaces.MUserRepository;
import com.dodam.hotel.repository.interfaces.PackageRepository;
import com.dodam.hotel.repository.interfaces.PoolRepository;
import com.dodam.hotel.repository.interfaces.ReservationRepository;
import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.interfaces.SpaRepository;
import com.dodam.hotel.repository.model.Dining;
import com.dodam.hotel.repository.model.DiningReservation;
import com.dodam.hotel.repository.model.Fitness;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Pool;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.Spa;

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
	@Autowired
	private FitnessRepository fitnessRepository;
	@Autowired
	private PoolRepository poolRepository;
	@Autowired
	private SpaRepository spaRepository;
	@Autowired
	private PackageRepository packageRepository;

	public List<Reservation> findTodayAllReservation() {
		List<Reservation> reservationList = reservationRepository.findAllReservation();
		return reservationList;
	}

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

	public Map<String, Object> findReservationById(Integer id) {
		Map<String, Object> mapList = new HashMap<>();
		Reservation reservation = reservationRepository.findReservationById(id);
		List<Room> roomList = roomRepository.findAllRoomList();
		List<Dining> diningList = diningRepository.findAllDining();
//        List<Fitness> fitnessList = fitnessRepository.findAllFitness();
//        List<Spa> spaList = spaRepository.findAllSpa();
//        List<Pool> poolList = poolRepository.findAllPool();
//        
		// Package에 관련된 테이블이 날라간 관계로 해당
		// 고쳐주세요 메서드 날아간듯 ㄷㄷ
		// List<PackageTB> packageTBList = packageRepository.findPackageList();
		// mapList.put("packageList", packageTBList);
		mapList.put("reservation", reservation);
		mapList.put("roomList", roomList);
		mapList.put("diningList", diningList);
//        mapList.put("fitnessList", fitnessList);
//        mapList.put("spaList", spaList);
//        mapList.put("poolList", poolList);

		return mapList;
	}

	@Transactional
	public int updateReservation(Reservation reservation) {
		int result = reservationRepository.updateReservation(reservation);
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
