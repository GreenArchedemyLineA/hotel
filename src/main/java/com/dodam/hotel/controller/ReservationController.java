package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.util.Define;
import com.dodam.hotel.util.ReservationOptionPrice;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationOptionPrice reservationOptionPrice;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private HttpSession session;
	
	// 메인페이지 -> 예약버튼 처리 (성희)
	@GetMapping("/reserve")
	public String reserveMain(ReservationRequestDto requestDto, Model model) {
		String[] array = requestDto.getDate().split(" to ");
		Integer countAll = requestDto.getCountPerson() + requestDto.getCountChild() + requestDto.getCountBaby();
		requestDto.setNumberOfP(countAll);
		// 출력
		for (int i = 0; i < array.length; i++) {
			requestDto.setStartDate(array[0]);
			requestDto.setEndDate(array[1]);
		}
		return null;
	}

	// 예약 페이지
	@GetMapping("/selectDate")
	public String selectDate() {
		return "/reservation/selectDate";
	}

	// 다이닝 예약 처리
	@PostMapping("/dining")
	public String reserveDining(ReservationRequestDto requestDto) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		int resultRowCount = reservationService.createReserveDining(requestDto, principal.getId());
		return "redirect:/";
	}
	
	// 객실 예약 상세 페이지
	@GetMapping("/reserveRoom")
	public String reservation(ReservationRequestDto selectReserveDetail, Model model) {
		model.addAttribute("selectDetail", selectReserveDetail);
		model.addAttribute("diningPrice", reservationOptionPrice.getDiningPrice());
		model.addAttribute("spaPrice", reservationOptionPrice.getSpaPrice());
		model.addAttribute("poolPrice", reservationOptionPrice.getPoolPrice());
		model.addAttribute("fitnessPrice", reservationOptionPrice.getFitnessPrice());
		
		return "/reservation/reservation";
	}
	
	// 객실 예약 처리
	@PostMapping("/reserveRoom")
	public String reserveRoom(ReservationRequestDto requestDto) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		int resultRowCount = reservationService.createReserveRoom(requestDto, principal.getId());
		return "redirect:/";
	}
}
