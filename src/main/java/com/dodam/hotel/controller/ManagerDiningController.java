package com.dodam.hotel.controller;

import com.dodam.hotel.repository.model.AllFacilities;
import com.dodam.hotel.repository.model.Dining;
import com.dodam.hotel.repository.model.DiningReservation;
import com.dodam.hotel.repository.model.Fitness;
import com.dodam.hotel.repository.model.Pool;
import com.dodam.hotel.repository.model.Spa;
import com.dodam.hotel.service.DiningService;
import com.dodam.hotel.service.FacilitiesService;
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
    @Autowired
    private FacilitiesService facilitiesService;
    @Autowired
    private DiningService diningService;
    
    @GetMapping("/dining")
    public String diningPage(Date date, Model model){
        List<DiningReservation> diningReservationList = null;
        if(date == null){
            diningReservationList = managerReservationService.readDiningReservationAllLisByDate(new Date(System.currentTimeMillis()));
        }else{
            diningReservationList = managerReservationService.readDiningReservationAllLisByDate(date);
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
    
    @GetMapping("/allDining")
    public String allDiningPage(Model model) {
    	List<DiningReservation> diningReservationList = managerReservationService.readAllDining();
    	 AtomicInteger reservationNumberOfP = new AtomicInteger();
         model.addAttribute("totalReservationNumOfP", reservationNumberOfP);
         model.addAttribute("diningList", diningReservationList);
         
         return "/manager/checkDining";
    }
    
    
    // 부대시설 페이지
    @GetMapping("/facilities")
    public String facPage(Model model) {
    	List<Dining> diningList = diningService.readAllDining();
    	model.addAttribute("diningList", diningList);
    	
    	Pool pool = facilitiesService.readPoolAll();
    	Spa spa = facilitiesService.readSpaAll();
    	Fitness fitness = facilitiesService.readFitnessAll();
    	model.addAttribute("pool", pool);
    	model.addAttribute("spa", spa);
    	model.addAttribute("fitness", fitness);
    	return "/manager/facilities";
    }
}

// 오전만 이용가능 조식(패키지예약) 조식관련된거 띄워야될거같음
// 2순위만들고
