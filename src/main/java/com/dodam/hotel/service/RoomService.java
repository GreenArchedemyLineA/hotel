package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.Room;

@Service
public class RoomService {
	
	@Autowired
	private RoomRepository roomRepository;
	
	// 모든 객실 조회
	@Transactional
	public List<Room> readAllRoom(String type) {
		String name = "%" + type + "%";
		List<Room> rooms = roomRepository.findAllRoom(type, name);
		
		return rooms;
	}
	
	// 특정 객실 조회
	@Transactional
	public Room readRoomById(Integer id) {
		Room roomEntity = roomRepository.findRoomById(id);
		return roomEntity;
	}
	
	/**
	 *  전체 예약 객실 조회 (성희)
	 */
	@Transactional
	public List<Room> readRoomAvailablebyDate(String startDate, String endDate) {
		List<Room> roomList = roomRepository.findRoombyDate(startDate, endDate);
		return roomList;
	}
	
} // end of class
