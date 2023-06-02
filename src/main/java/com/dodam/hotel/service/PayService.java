package com.dodam.hotel.service;

import com.dodam.hotel.dto.PayDto;
import com.dodam.hotel.enums.Grade;
import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.interfaces.PayRepository;
import com.dodam.hotel.repository.interfaces.PointRepository;
import com.dodam.hotel.repository.interfaces.ReservationRepository;
import com.dodam.hotel.repository.model.Pay;
import com.dodam.hotel.repository.model.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PayService {
    @Autowired
    private PayRepository payRepository;
    @Autowired
    private PointRepository pointRepository;
    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private CouponRepository couponRepository;
    @Transactional
    public int createPay(PayDto payDto){
        int result = payRepository.insertPay(payDto);
        return result == 1 ? 1 : 0;
    }

    @Transactional
    public int refundPay(Integer reservationId, Integer userId){
        Reservation reservation = reservationRepository.findReservationById(reservationId);
        String tid = reservation.getPayTid();
        Pay payInfo = payRepository.findByTidPay(tid);
        Integer point = payInfo.getPrice();
        if(Grade.DIA.equals(payInfo.getGrade())){
            point = Integer.valueOf((int) Math.round(point * 0.07));
        }else if(Grade.GOLD.equals(payInfo.getGrade())){
            point = Integer.valueOf((int) Math.round(point * 0.05));
        }else{
            point = Integer.valueOf((int) Math.round(point * 0.04));
        }
        point *= -1;

        pointRepository.insertPoint(point, userId);
        reservationRepository.deleteReservation(reservationId);

        couponRepository.deleteByUserIdandCouponInfoId(userId, 1);
        return 0;
    }
}
