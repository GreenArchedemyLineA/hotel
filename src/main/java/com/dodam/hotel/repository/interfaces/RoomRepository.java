package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.repository.model.Room;

@Mapper
public interface RoomRepository {
	
	// 전체 객실 조회 (카테고리별)
	public List<Room> findAllRoom(@Param("type") String type, @Param("name") String name);
	
	// 객실 상세페이지 조회
	public Room findRoomById(Integer id);
	
	// 예약된 객실 조회
	public List<Room> findRoombyDate(@Param("startDate")String startDate, @Param("endDate")String endDate); 
	
} // end of class
