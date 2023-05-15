package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.Room;

@Mapper
public interface RoomRepository {
	
	public List<Room> findAllRoom();
	
} // end of class
