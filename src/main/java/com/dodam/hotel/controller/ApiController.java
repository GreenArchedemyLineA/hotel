package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.service.GradeService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GradeService gradeService;
	
	@GetMapping("/userInfo")
	public UserResponseDto.MyPageResponseDto updateUserInfo() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		// 회원 정보 불러오기
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		
		return responseUser;
	}
	
	@GetMapping("/userGrade")
	public GradeInfo userGrade() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		// 등급 정보 불러오기
		GradeInfo responseGrade = gradeService.readGradeByUserId(principal.getId());
		return responseGrade;
	}
} // end of class
