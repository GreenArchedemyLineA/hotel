package com.dodam.hotel.controller;

import com.dodam.hotel.repository.model.managertest.DiningReservation;
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
        List<DiningReservation> diningReservationList = null;
        if(date == null){
            diningReservationList = managerReservationService.findDiningReservationAllList(new Date(System.currentTimeMillis()));
        }else{
            diningReservationList = managerReservationService.findDiningReservationAllList(date);
        }
        AtomicInteger reservationNumberOfP = new AtomicInteger();

        diningReservationList.stream().forEach(
                (diningReservation) -> {
                    reservationNumberOfP.addAndGet(diningReservation.getNumberOfP());
                }
        );

        model.addAttribute("totalReservationNumOfP", reservationNumberOfP);
        model.addAttribute("diningList", diningReservationList);

        return "/manager/checkDining";
    }

}

// 오전만 이용가능 조식(패키지예약) 조식관련된거 띄워야될거같음
// 2순위만들고
