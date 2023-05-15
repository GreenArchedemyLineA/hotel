package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.model.Room;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoomRepository {
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
}
