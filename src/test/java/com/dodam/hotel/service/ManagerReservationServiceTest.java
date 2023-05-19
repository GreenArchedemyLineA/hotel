package com.dodam.hotel.service;

import com.dodam.hotel.repository.interfaces.*;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.managertest.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ManagerReservationServiceTest {
    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private MUserRepository mUserRepository;
    @Autowired
    private DiningRepository diningRepository;
    @Autowired
    private FitnessRepository fitnessRepository;
    @Autowired
    private PoolRepository poolRepository;
    @Autowired
    private SpaRepository spaRepository;

    @Test
    public void updateReservation(){
        // when
        int count = 0;
        Reservation reservation = reservationRepository.findReservationById(2);
        reservation.setRoomId(1);
        reservation.setDiningId(1);
        System.out.println(reservation.getStartDate());
        int result = reservationRepository.updateReservation(reservation);
        reservation.setRoomId(1);
        reservation.setDiningId(null);
        int result2 = reservationRepository.updateReservation(reservation);
        // given
        count += result;
        count += result2;

        // then
        assertEquals(2, count);
    }
    @Test
    public void findReservation(){
        Integer id = 1;
        Map<String, Object> mapList = new HashMap<>();
        Reservation reservation = reservationRepository.findReservationById(id);
        List<Room> roomList = roomRepository.findAllRoomList();
        List<Dining> diningList = diningRepository.findAllDining();
        List<Fitness> fitnessList = fitnessRepository.findAllFitness();
        List<Spa> spaList = spaRepository.findAllSpa();
        List<Pool> poolList = poolRepository.findAllPool();
        System.out.println("=====");
        System.out.println(reservation);
        System.out.println(diningList);
        System.out.println(fitnessList);
        System.out.println(spaList);
        System.out.println(poolList);
        System.out.println("====");
        mapList.put("reservation", reservation);
        mapList.put("roomList", roomList);
        mapList.put("diningList", diningList);
        mapList.put("fitnessList", fitnessList);
        mapList.put("spaList", spaList);
        mapList.put("poolList", poolList);
        System.out.println(mapList);
    }
}