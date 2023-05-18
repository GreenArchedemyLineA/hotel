package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.Room;

@Service
public class RoomService {
	
	@Autowired
	private RoomRepository roomRepository;
	
	public List<Room> readAllRoom(String type) {
		String name = "%" + type + "%";
		List<Room> rooms = roomRepository.findAllRoom(type, name);
		
		return rooms;
	}
	
	public Room readRoomById(Integer id) {
		Room roomEntity = roomRepository.findRoomById(id);
		return roomEntity;
	}
	
	/**
	 *  전체 예약 객실 조회 (성희)
	 */
	public List<Room> readRoomAvailablebyDate(ReservationRequestDto requestDto) {
		String[] array = requestDto.getDate().split(" to ");
		Integer countAll = requestDto.getCountPerson() + requestDto.getCountChild() + requestDto.getCountBaby();
		requestDto.setNumberOfP(countAll);
		// 출력
		for (int i = 0; i < array.length; i++) {
			requestDto.setStartDate(array[0]);
			requestDto.setEndDate(array[1]);
		}
		List<Room> roomList = roomRepository.findRoombyDate(requestDto);
		return roomList;
	}
	
} // end of class
