package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.repository.model.Room;

@Mapper
public interface RoomRepository {
	
	public List<Room> findAllRoom(@Param("type") String type, @Param("name") String name);
	
	public Room findRoomById(Integer id);
	
} // end of class
