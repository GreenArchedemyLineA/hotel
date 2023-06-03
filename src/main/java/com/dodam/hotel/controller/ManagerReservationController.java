package com.dodam.hotel.controller;

import com.dodam.hotel.dto.api.ResponseMsg;

import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.service.ManagerReservationService;
import com.dodam.hotel.service.ManagerService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.util.DateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

/**
 * @author lhs-devloper
 */
@Controller
@RequestMapping("/manager")
public class ManagerReservationController {
    @Autowired
    private HttpSession session;
    @Autowired
    private ManagerReservationService managerReservationService;
    @Autowired
    private ManagerService managerService;

    @GetMapping("/reservation")
    public String reservationList(String name, Model model){
        if(name == null || name.equals("")){
            List<Reservation> reservationList = managerReservationService.findTodayAllReservation();
            model.addAttribute("reservationList", reservationList);
        }else{
            List<Reservation> reservationList = managerReservationService.findUserReservation(name);
            System.out.println(reservationList);
            model.addAttribute("reservationList", reservationList);
        }
        int totalPrice = managerReservationService.readBeforeTodayTotalPrice();
        List<Integer> price = new ArrayList<>();
        for(int i = 1; i < 7; i ++) {
        	Integer beforetotalPrice = managerReservationService.readBeforeTotalPrice(i);
        	if(beforetotalPrice == null) {
        		beforetotalPrice = 0;
        	}
        	price.add(beforetotalPrice);
        }
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("price", price);
        return "/manager/reservation";
    }

    @GetMapping("/reservation/{id}")
    public String reservationDetail(@PathVariable Integer id, Model model){
        Map<String, Object> reservationMap = managerReservationService.findReservationById(id);
        System.out.println(reservationMap.get("reservation"));
        model.addAttribute("reservation", reservationMap.get("reservation"));
        model.addAttribute("roomList", reservationMap.get("roomList"));
        model.addAttribute("spaList", reservationMap.get("spaList"));
        model.addAttribute("poolList", reservationMap.get("poolList"));
        model.addAttribute("fitnessList", reservationMap.get("fitnessList"));
        model.addAttribute("diningList", reservationMap.get("diningList"));
        model.addAttribute("packageList", reservationMap.get("packageList"));
        return "/manager/reservationDetail";
    }

    @PostMapping("/reservation/update")
    public String reservationUpdate(Reservation reservation){
//        Manager manager = (Manager) session.getAttribute("principal");

//        if(manager == null){
//            return null;
//        }
        int result = managerReservationService.updateReservation(reservation);
//        if(result == 0){
//            // Exception Error
//            return null;
//        }else{
//            return "redirect:/manager/reservation";
//        }
        return "redirect:/manager/reservation";
    }

    @ResponseBody
    @DeleteMapping("/reservation/delete")
    public ResponseMsg resrvationDelete(Integer id){
        Manager manager = (Manager) session.getAttribute("principal");
        if(manager == null){
            ResponseMsg failMsg = ResponseMsg
                    .builder()
                    .status_code(HttpStatus.FORBIDDEN.value())
                    .msg("삭제권한이 없습니다")
                    .redirect_uri(null)
                    .build();
            return failMsg;
        }
        int result = managerReservationService.deleteReservation(id);
        if(result == 0){
            ResponseMsg failMsg = ResponseMsg
                    .builder()
                    .status_code(HttpStatus.BAD_REQUEST.value())
                    .msg("삭제에 실패하였습니다")
                    .redirect_uri(null)
                    .build();
            return failMsg;
        }else{
            ResponseMsg succesMsg = ResponseMsg
                    .builder()
                    .status_code(HttpStatus.OK.value())
                    .msg("삭제되었습니다")
                    .redirect_uri("/reservation")
                    .build();
            return succesMsg;
        }
    }

}