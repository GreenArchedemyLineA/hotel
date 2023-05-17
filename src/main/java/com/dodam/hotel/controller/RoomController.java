package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@GetMapping("/room")
	public String roomPage(Model model, @RequestParam(name = "type", defaultValue = "All", required = false) String type) {
		 System.out.println(type);
		 List<Room> rooms = roomService.readAllRoom(type);
		 System.out.println(rooms);
		 model.addAttribute("roomList", rooms);
		return "/room/list";
	}
	
	@GetMapping("/detailRoom/{id}")
	public String roomDetailPage(Model model, @PathVariable Integer id) {
		Room responseRoom = roomService.readRoomById(id);
		model.addAttribute("room", responseRoom);
		return "/room/roomDetail";
	}
	
	// 예약 가능 객실 조회
	@GetMapping("/search")
	public String roomAvailable(Model model, ReservationRequestDto reservationRequestDto) {
		String[] array = reservationRequestDto.getDate().split(" to ");
		for (int i = 0; i < array.length; i++) {
			reservationRequestDto.setStartDate(array[0]);
			reservationRequestDto.setEndDate(array[1]);
		}
		System.out.println(reservationRequestDto.getStartDate() + reservationRequestDto.getEndDate());
		List<Room> roomList = roomService.readRoomAvailablebyDate(reservationRequestDto.getStartDate(), reservationRequestDto.getEndDate());
		System.out.println(roomList);
		model.addAttribute("roomList", roomList);
		return "/reservation/searchRoom";
	}
	
} // end of class
