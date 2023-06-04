package com.dodam.hotel.service;

import com.dodam.hotel.dto.PayDto;
import com.dodam.hotel.enums.Grade;
import com.dodam.hotel.repository.interfaces.*;
import com.dodam.hotel.repository.model.GradeInfo;
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
    @Autowired
    private GradeRepository gradeRepository;

    @Transactional
    public int createPay(PayDto payDto){
        int result = payRepository.insertPay(payDto);
        return result == 1 ? 1 : 0;
    }

    @Transactional
    public boolean refundPay(Integer reservationId, Integer userId){
        Reservation reservation = reservationRepository.findReservationById(reservationId);

        // 예약검사 실패 시
        if(reservation == null){
            return false;
        }

        String tid = reservation.getPayTid();
        Pay payInfo = payRepository.findByTidPay(tid);
        Integer point = payInfo.getPrice();
        String beforeUserGrade = payInfo.getGradeName();
        if(Grade.DIA.equals(beforeUserGrade)){
            point = Integer.valueOf((int) Math.round(point * 0.07));
        }else if(Grade.GOLD.equals(beforeUserGrade)){
            point = Integer.valueOf((int) Math.round(point * 0.05));
        }else{
            point = Integer.valueOf((int) Math.round(point * 0.04));
        }
        point *= -1;

        pointRepository.insertPoint(point, userId);
        reservationRepository.deleteReservation(reservationId);

        GradeInfo userGrade = gradeRepository.findGradeByUserId(userId);
        Grade grade = Grade.valueOf(userGrade.getGrade().getName());
        if(!beforeUserGrade.equals(userGrade.getGrade().getName())){
            if(Grade.DIA.equals(beforeUserGrade)){
                grade = Grade.DIA;
            }else if(Grade.GOLD.equals(beforeUserGrade)){
                grade = Grade.GOLD;
            }else{
                grade = Grade.BROWN;
            }
            gradeRepository.updateUserGrade(userId, grade);
        }
        System.out.println(grade);
        if(grade.getGrade() == 1){
            couponRepository.deleteByUserIdandCouponInfoId(userId, 2);
            couponRepository.deleteByUserIdandCouponInfoId(userId, 3);
            couponRepository.deleteByUserIdandCouponInfoId(userId, 4);
        }else if(grade.getGrade() == 2){
            couponRepository.deleteByUserIdandCouponInfoId(userId, 3);
            couponRepository.deleteByUserIdandCouponInfoId(userId, 4);
        }
        return true;
    }
    
    @Transactional
    public Pay searchType(String tid) {
    	
    	return payRepository.findByTidPay(tid);
    }
}
