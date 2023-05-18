package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
		 List<Room> rooms = roomService.readAllRoom(type);
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
	@PostMapping("/search")
	public String roomAvailable(Model model, ReservationRequestDto requestDto) {
		System.out.println(requestDto);
		List<Room> roomList = roomService.readRoomAvailablebyDate(requestDto);
		model.addAttribute("roomList", roomList);
		return "/reservation/searchRoom";
	}
	
} // end of class
