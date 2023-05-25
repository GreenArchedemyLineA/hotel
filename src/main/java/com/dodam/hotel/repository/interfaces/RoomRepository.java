package com.dodam.hotel.repository.interfaces;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.RoomType;

@Mapper
public interface RoomRepository {
	
	// 전체 객실 조회 (카테고리별)
	public List<RoomType> findAllRoom(@Param("type") String type, @Param("name") String name);
	
	// 객실 상세페이지 조회
	public RoomType findRoomById(Integer id);
	
	// 예약된 객실 조회
	public List<Room> findRoombyDate(ReservationRequestDto reservationRequestDto); 
	
	List<Room> findAllRoomList();

    // 인원 수
    List<Room> findOptionSearchOneRoomList(StatusParams statusParams);
    List<Room> findOptionStatusAndNumberOfpRoomList(StatusParams statusParams);
    // 현재 상태 및 인원 수
    List<Room> findOptionStatusAndPriceRoomList(StatusParams statusParams);
    // 인원 수 및 가격
    List<Room> findOptionNumberOfpAndPriceRoomList(StatusParams statusParams);

    // 모든 옵션 조건
    List<Room> findAllOptionRoomList(StatusParams statusParams);
    /*
    private String name;
    private Integer price;
    private Boolean availability;
    private String description;
    private String image;
    private String status_desc;
    private Integer number_of_p;
     */
    int insertRoom(Room room);

    Room findById(Integer roomId);
    
} // end of class
