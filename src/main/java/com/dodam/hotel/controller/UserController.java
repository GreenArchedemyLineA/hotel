package com.dodam.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.TestDto;

@Controller
public class UserController {
	
	@GetMapping({"","/"})
	public String mainPage() {
		return "/main";
	}
	
	
	@GetMapping("/test")
	public String testPage() {
		return "/test";
	}
	@GetMapping("/test2")
	public String testPage2() {
		return "/test2";
	}
	
	@PostMapping("/test")
	public String test(TestDto dto) {
		System.out.println(dto.getUsername());
		System.out.println(dto.getPassword());
		System.out.println();
		return "/";
		
	}
	
	public String managerLogin() {
		return "";
	}
} // end of class
