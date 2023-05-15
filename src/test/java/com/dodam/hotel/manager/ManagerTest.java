package com.dodam.hotel.manager;

import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.model.Room;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.context.annotation.Import;

@MybatisTest
// 실 b
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import(Room.class)
public class ManagerTest {
    @Autowired
    private RoomRepository roomRepository;
    @Test
    public void insertData(){
        // given
        Room room = new Room();
        room.setName("test");
        room.setAvailability(true);
        room.setDescription("test");
        room.setNumberOfp(10);
        room.setPrice(100_000);
        room.setImage(null);
        room.setStatusDesc(null);


        // when
        int result = roomRepository.insertRoom(room);
        // then
        Assertions.assertEquals(1, result);
    }
}
