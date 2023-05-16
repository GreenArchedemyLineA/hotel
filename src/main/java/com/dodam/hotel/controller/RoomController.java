package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

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
	
} // end of class
