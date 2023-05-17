package com.dodam.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dodam.hotel.dto.ReservationRequestDto;

@Controller
public class ReservationController {

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

//	// 예약 객실 검색 처리
//	@GetMapping("/search")
//	public String searchRoom(ReservationRequestDto requestDto, Model model) {
//		String[] array = requestDto.getDate().split(" to ");
//		Integer countAll = requestDto.getCountPerson() + requestDto.getCountChild() + requestDto.getCountBaby();
//		requestDto.setNumberOfP(countAll);
//		// 출력
//		for (int i = 0; i < array.length; i++) {
//			requestDto.setStartDate(array[0]);
//			requestDto.setEndDate(array[1]);
//		}
//		
//		return "/reservation/searchRoom";
//	}

}
