package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;

import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.model.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.InsertDto;
import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.repository.interfaces.ManagerRepository;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.service.ManagerService;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private HttpSession session;

	@Autowired
	private ManagerRepository managerRepository;

	@GetMapping("/managerPage")
	public String managerPage() {

		return "/test";
	}

	@PostMapping("/managerSignInProc")
	public String managersign(ManagerSignInFormDto managerSignInFormDto) {

		Manager principal = managerService.managerSign(managerSignInFormDto);
		System.out.println(managerSignInFormDto.getUsername());
		System.out.println(managerSignInFormDto.getPassword());
		System.out.println(principal);
		if (principal != null) {
			session.setAttribute("principal", principal);
		}
		return "redirect:/";
	}

	@PostMapping("/managerInsert")
	public String insert(InsertDto insertDto) {

		int insert = managerRepository.insert(insertDto);
		if (insert == 0) {
			return "/test";
		}
		return "redirect:/";
	}

	public String Check(StatusParams statusParams, Model model) {
		List<Room> rooms;
		System.out.println(statusParams);
		// 전체 조회
		if (statusParams.getRoomStatus() == null
				&& statusParams.getPrice() == null
				&& statusParams.getNumberOfp() == null) {
			rooms = managerService.findAllRoomList();
		}
		// 선택 조회(?? 변경 필요)
		else {
			rooms = managerService.findConditionsRoomList(statusParams);
		}

		model.addAttribute("roomList", rooms);
		return "/manager/status";
	}

	@GetMapping("/roomStatusDetail")
	public String RoomStatusDetail(Integer roomId, Model model) {
		Room room = managerService.findByRoom(roomId);

		model.addAttribute("room", room);
		return "/manager/roomDetailStatus";
	}
}
