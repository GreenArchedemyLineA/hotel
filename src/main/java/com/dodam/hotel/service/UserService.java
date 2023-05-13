package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserRequestDto.insertDto;
import com.dodam.hotel.repository.interfaces.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	/**
	 *  회원가입 서비스 (성희)
	 */
	@Transactional
	public void createUser(UserRequestDto.insertDto insertDto) {
		// 중복 회원가입 검사
		// 조회 돌리기
		System.out.println(insertDto.toString());
		int resultRowCount = userRepository.insert(insertDto);
		if (resultRowCount != 1) {
			System.out.println("회원가입 서비스 오류");
		}
	}
	
}
