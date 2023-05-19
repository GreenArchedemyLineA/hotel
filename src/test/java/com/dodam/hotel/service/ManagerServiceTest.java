package com.dodam.hotel.service;

import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.model.managertest.Room;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class ManagerServiceTest {
    @Autowired
    private ManagerService managerService;

    @Test
    public void findServiceOneOptionTest(){
        // 가격, 수용인원, 방 사용가능여부
        // given
        StatusParams statusParams1 = new StatusParams();
        StatusParams statusParams2 = new StatusParams();
        StatusParams statusParams3 = new StatusParams();
        statusParams1.setPrice(100_000);
        statusParams2.setNumberOfp(5);
        statusParams3.setRoomStatus(true);
        // when
        List<Room> rooms1 = managerService.findConditionsRoomList(statusParams1);
        List<Room> rooms2 = managerService.findConditionsRoomList(statusParams2);
        List<Room> rooms3 = managerService.findConditionsRoomList(statusParams3);
        // then
        Assertions.assertEquals(2, rooms1.get(0).getId());
        Assertions.assertEquals(0, rooms2.size());
        Assertions.assertEquals(2, rooms3.get(0).getId());
    }
}