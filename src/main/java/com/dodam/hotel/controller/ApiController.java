package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.dto.api.ResponseMsg;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;
/**
 * 
 * @author 김현우
 *
 */
@RestController
@RequestMapping("/api")
public class ApiController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	// 회원 정보 수정용
	@GetMapping("/myInfo")
	public UserResponseDto.MyPageResponseDto updateUserInfo() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		// 회원 정보 불러오기
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		
		return responseUser;
	}
	
	// 아이디 중복검사(현우)
	@GetMapping("/duplicationUser")
	public ResponseMsg checkDuplicationUser(@RequestParam String email) {
		User responseUser = userService.readUserForDuplicationCheck(email);
		if(responseUser == null) {
			ResponseMsg successMsg = ResponseMsg
					.builder()
					.status_code(HttpStatus.OK.value())
					.msg("사용가능한 아이디 입니다.")
					.build();
			return successMsg;
		} else {
		 ResponseMsg failMsg = ResponseMsg
				 .builder()
				 // 대상 리소스의 현재 상태와 충돌하여 요청을 완료할 수 없음을 뜻한다.
				 .status_code(HttpStatus.CONFLICT.value())
				 .msg("중복된 아이디가 존재합니다.")
				 .build();
		 return failMsg;
		}
	}
	
} // end of class
