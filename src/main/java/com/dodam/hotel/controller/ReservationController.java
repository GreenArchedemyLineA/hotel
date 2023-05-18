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
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;

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
		System.out.println(requestDto);
		return null;
	}

	// 예약 페이지
	@GetMapping("/reservePage")
	public String reservePage() {
		return "/reservation/reservation";
	}

	// 다이닝 예약 처리
	@PostMapping("/dining")
	public String reserveDining(ReservationRequestDto requestDto, Model model) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		requestDto.setUserId(responseUser.getId());
		requestDto.setStartDate(requestDto.getDate());
		requestDto.setEndDate(requestDto.getDate());
//		requestDto.setDiningId(1);
		int numberOfP = requestDto.getCountPerson() + requestDto.getCountChild() + requestDto.getCountBaby();
		requestDto.setNumberOfP(numberOfP);
		int resultRowCount = reservationService.createReserveDining(requestDto);
		return "redirect:/";
	}

}
