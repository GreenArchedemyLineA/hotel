package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.repository.model.managertest.Reservation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author lhs-devloper
 */
@Mapper
public interface ReservationRepository {
    List<Reservation> findReservationByUserId(Integer userId);
    List<Reservation> findAllReservation();
    int updateReservation(Reservation reservation);
    int deleteReservation(Integer id);

    Reservation findReservationById(Integer id);
}
