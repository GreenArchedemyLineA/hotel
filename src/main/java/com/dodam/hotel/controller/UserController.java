package com.dodam.hotel.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	
	// 메인 페이지 (성희)
	@GetMapping({"","/"})
	public String mainPage() {
		return "/main";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "/user/login";
	}
	
	@GetMapping("/myPage")
	public String myPage(Model model) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute("principal");
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		model.addAttribute("responseUser", responseUser);
		return "/user/myPage";
	}
	
	@PostMapping("/loginProc")
	public String loginProc(UserRequestDto.LoginFormDto loginDto) {
		UserResponseDto.LoginResponseDto principal = userService.readUserByIdAndPassword(loginDto);
		session.setAttribute("principal", principal);
		return "redirect:/myPage";
	}
	
	// 회원정보 수정 처리 (김현우)
	@PostMapping("/myPageProc")
	public String myPageProc(UserRequestDto.MyPageFormDto myPageDto) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute("principal");
		User responseUser = userService.updateUser(myPageDto);
		
		// 비밀번호 수정 시, DB 비밀번호랑 맞는지 확인 (암호화 처리 예정) - 다를경우 바뀐 비밀번호로 세팅
		if (principal.getPassword() != responseUser.getPassword()) {
			principal.setPassword(myPageDto.getPassword());
		}
		
		return "redirect:/myPage";
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
	
	// 멤버쉽 페이지 (성희)
	@GetMapping("/membership")
	public String membership() {
		return "/membership";
	}
	
	
} // end of class
