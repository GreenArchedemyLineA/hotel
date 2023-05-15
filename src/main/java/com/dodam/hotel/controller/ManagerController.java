package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.InsertDto;
import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.repository.ManagerRepository;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.service.ManagerService;

@Controller
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
		if(principal != null) {
			session.setAttribute("principal", principal);
		}
		return "redirect:/"; 
	}
	@PostMapping("/managerInsert")
	public String insert(InsertDto insertDto) {
		
		int insert = managerRepository.insert(insertDto);
		if(insert == 0) {
			return "/test";
		}
		return "redirect:/";
	}
	
}
