package com.dodam.hotel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.dto.ReservationRequestDto;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	// 객실 페이지로 이동
	@GetMapping("/room")
	public String roomPage(Model model, @RequestParam(name = "type", defaultValue = "All", required = false) String type) {
		 List<Room> rooms = roomService.readAllRoom(type);
		 model.addAttribute("roomList", rooms);
		return "/room/list";
	}
	
	// 객실 상세 페이지
	@GetMapping("/detailRoom/{id}")
	public String roomDetailPage(Model model, @PathVariable Integer id) {
		Room responseRoom = roomService.readRoomById(id);
		model.addAttribute("room", responseRoom);
		return "/room/roomDetail";
	}
	
	// 예약 가능 객실 조회
	@GetMapping("/search")
	public String roomAvailable(Model model, ReservationRequestDto requestDto) {
		Map<String, Object> selectList = roomService.readRoomAvailablebyDate(requestDto);
		// Stream API , map, filter, foreach.. 이런 방법도 있다..~~!!
		model.addAttribute("roomList", selectList.get("roomList"));
		model.addAttribute("searchDto", selectList.get("searchDto"));
		return "/reservation/searchRoom";
	}
	
} // end of class
