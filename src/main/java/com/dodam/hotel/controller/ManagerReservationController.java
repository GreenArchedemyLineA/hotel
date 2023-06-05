package com.dodam.hotel.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dodam.hotel.dto.api.ResponseMsg;
import com.dodam.hotel.handler.exception.ManagerCustomRestFullException;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.service.ManagerReservationService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.util.PagingObj;

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
	private ReservationService reservationService;

    @GetMapping("/reservation")
    public String reservationList(String name, Model model){
        if(name == null || name.equals("")){
            List<Reservation> responseReservations = managerReservationService.readTodayReservation();
            model.addAttribute("reservationList", responseReservations);
        }else{
            List<Reservation> responseReservations = managerReservationService.readUserReservation(name);
            model.addAttribute("reservationList", responseReservations);
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
    	if(id == null) {
    		throw new ManagerCustomRestFullException("아이디가 입력되지 않았습니다.", HttpStatus.BAD_REQUEST);
    	}
        Map<String, Object> reservationMap = managerReservationService.readReservationById(id);
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
        managerReservationService.updateReservation(reservation);
        return "redirect:/manager/reservation";
    }
    
	// 전체 예약 리스트 조회
	@GetMapping("/allReservation")
	public String allReservationList(String name, Model model,
			@RequestParam(name = "nowPage", defaultValue = "1", required = false) String nowPage,
			@RequestParam(name = "cntPerPage", defaultValue = "5", required = false) String cntPerPage) {

		int total = 0;
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", obj);
		if (name == null || name.equals("")) {
			List<Reservation> reservationList = managerReservationService.readAllReservation();
			model.addAttribute("reservationList", reservationList);
		} else {
			List<Reservation> reservationList = managerReservationService.readUserReservation(name);
			model.addAttribute("reservationList", reservationList);
			total = reservationService.readAllReservationByUserIdCount(reservationList.get(1).getUserId());
			model.addAttribute("viewAll",
					reservationService.readAllResrevationByUserIdPaging(obj, reservationList.get(1).getUserId()));
		}
		return "/manager/reservation";
	}

	@ResponseBody
	@DeleteMapping("/reservation/delete")
	public ResponseMsg resrvationDelete(Integer id) {
		Manager manager = (Manager) session.getAttribute("principal");
		if (manager == null) {
			ResponseMsg failMsg = ResponseMsg.builder().status_code(HttpStatus.FORBIDDEN.value()).msg("삭제권한이 없습니다")
					.redirect_uri(null).build();
			return failMsg;
		}
		int result = managerReservationService.deleteReservation(id);
		if (result == 0) {
			ResponseMsg failMsg = ResponseMsg.builder().status_code(HttpStatus.BAD_REQUEST.value()).msg("삭제에 실패하였습니다")
					.redirect_uri(null).build();
			return failMsg;
		} else {
			ResponseMsg successMsg = ResponseMsg.builder().status_code(HttpStatus.OK.value()).msg("삭제되었습니다")
					.redirect_uri("/manager/reservation").build();
			return successMsg;
		}
	}

}