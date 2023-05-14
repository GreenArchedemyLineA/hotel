package com.dodam.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// 메인 페이지 (성희)
	@GetMapping({"","/"})
	public String mainPage() {
		return "/main";
	}
	
	// 회원가입 페이지 (성희)
	@GetMapping("/join")
	public String joinPage() {
		return "/user/join";
	}
	
	// 회원가입 처리 (성희)
	@PostMapping("/join")
	public String join(UserRequestDto.insertDto insertDto) {
		userService.createUser(insertDto);
		return "redirect:/";
	}
	
	@GetMapping("/membership")
	// 멤버쉽 페이지 (성희)
	public String membership() {
		return "/membership";
	}
	
	
} // end of class
