package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	
	@GetMapping("/room")
	public String roomPage(Model model) {
		 List<Room> rooms = roomService.readAllRoom();
		 System.out.println(rooms);
		 model.addAttribute("roomList", rooms);
		return "/room/list";
	}
	
}
