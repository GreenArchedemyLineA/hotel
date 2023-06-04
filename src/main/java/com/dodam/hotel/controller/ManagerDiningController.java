package com.dodam.hotel.controller;

import com.dodam.hotel.repository.model.DiningReservation;


import com.dodam.hotel.service.ManagerReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author lhs-devloper
 */
@Controller
@RequestMapping("/manager")
public class ManagerDiningController {
    @Autowired
    private ManagerReservationService managerReservationService;

    @GetMapping("/dining")
    public String testPage(Date date, Model model){
        List<DiningReservation> responseDiningReservations = null;
        if(date == null){
        	responseDiningReservations = managerReservationService.readDiningReservationAllList(new Date(System.currentTimeMillis()));
        }else{
        	responseDiningReservations = managerReservationService.readDiningReservationAllList(date);
        }
        AtomicInteger reservationNumberOfP = new AtomicInteger();

        responseDiningReservations.stream().forEach(
                (diningReservation) -> {
                    reservationNumberOfP.addAndGet(diningReservation.getNumberOfP());
                }
        );

        model.addAttribute("totalReservationNumOfP", reservationNumberOfP);
        model.addAttribute("diningList", responseDiningReservations);

        return "/manager/checkDining";
    }

}

// 오전만 이용가능 조식(패키지예약) 조식관련된거 띄워야될거같음
// 2순위만들고
