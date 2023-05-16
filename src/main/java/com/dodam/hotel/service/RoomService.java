package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.repository.interfaces.RoomRepository;
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
	
} // end of class
