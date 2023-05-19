package com.dodam.hotel.service;

import com.dodam.hotel.repository.interfaces.*;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.managertest.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lhs-devloper
 */
@Service
public class ManagerReservationService {
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
    @Autowired
    private PackageRepository packageRepository;



    public List<Reservation> findTodayAllReservation(){
        List<Reservation> reservationList = reservationRepository.findAllReservation();
        return reservationList;
    }
    public List<Reservation> findUserReservation(String name){
        List<Reservation> reservationList = new ArrayList<>();
        List<MUser> userList = mUserRepository.findByname(name);
        System.out.println(userList);
        userList.stream().forEach((user) ->{
            List<Reservation> reservationUserList = reservationRepository.findReservationByUserId(user.getId());
            reservationUserList.forEach((reservation -> {
                reservationList.add(reservation);
            }));
        });

        return reservationList;
    }

    public Map<String, Object> findReservationById(Integer id){
        Map<String, Object> mapList = new HashMap<>();
        Reservation reservation = reservationRepository.findReservationById(id);
        List<Room> roomList = roomRepository.findAllRoomList();
        List<Dining> diningList = diningRepository.findAllDining();
        List<Fitness> fitnessList = fitnessRepository.findAllFitness();
        List<Spa> spaList = spaRepository.findAllSpa();
        List<Pool> poolList = poolRepository.findAllPool();
        List<PackageTB> packageTBList = packageRepository.findPackageList();
        mapList.put("reservation", reservation);
        mapList.put("roomList", roomList);
        mapList.put("diningList", diningList);
        mapList.put("fitnessList", fitnessList);
        mapList.put("spaList", spaList);
        mapList.put("poolList", poolList);
        mapList.put("packageList", packageTBList);

        return mapList;
    }

    @Transactional
    public int updateReservation(Reservation reservation){
        int result = reservationRepository.updateReservation(reservation);
        return result;
    }
    @Transactional
    public int deleteReservation(Integer id){
        int result = reservationRepository.deleteReservation(id);
        return result;
    }
}
