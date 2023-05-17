package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.repository.model.managertest.Reservation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationRepository {
    Reservation findReservationByUserId(Integer userId);
    int updateReservation(Reservation reservation);
    int deleteReservation(Integer id);
}
