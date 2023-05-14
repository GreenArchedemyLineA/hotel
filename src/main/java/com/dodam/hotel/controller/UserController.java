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
	
	@PostMapping("/myPageProc")
	public String myPageProc(UserRequestDto.MyPageFormDto myPageDto) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute("principal");
		User responseUser = userService.updateUser(myPageDto);
		
		if (principal.getPassword() != responseUser.getPassword()) {
			principal.setPassword(responseUser.getPassword());
		}
		
		return "redirect:/myPage";
	}
	
	
	
} // end of class
