package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.interfaces.MembershipRepository;
import com.dodam.hotel.repository.interfaces.UserRepository;
import com.dodam.hotel.repository.model.User;


@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private MembershipRepository membershipRepository;
	@Autowired
	private CouponRepository couponRepository;
	

	public UserResponseDto.LoginResponseDto readUserByIdAndPassword(UserRequestDto.LoginFormDto user) {
		UserResponseDto.LoginResponseDto responseUser = userRepository.findUserByLoginFormDto(user);
		return responseUser;
	}
	
	public UserResponseDto.MyPageResponseDto readUserByEmail(String email) {
		User userEntity = userRepository.findUserByEmail(email);
		UserResponseDto.MyPageResponseDto responseDto = new UserResponseDto.MyPageResponseDto();
		responseDto.setId(userEntity.getId());
		responseDto.setEmail(userEntity.getEmail());
		responseDto.setPassword(userEntity.getPassword());
		responseDto.setName(userEntity.getName());
		responseDto.setGender(userEntity.getGender());
		responseDto.setBirth(userEntity.getBirth());
		responseDto.setTel(userEntity.getTel());
		return responseDto;
	}
	
	public User updateUser(UserRequestDto.MyPageFormDto user) {
		int resultRow = userRepository.updateUserByEmail(user);
		if (resultRow != 1) {
			// 예외 처리
		}
		User userEntity = userRepository.findUserByEmail(user.getEmail());
		return userEntity;
	}
	
	/**
	 *  회원가입 서비스 (성희)
	 */
	@Transactional
	public void createUser(UserRequestDto.insertDto insertDto) {
		// 중복 회원가입 검사 (todo)
		// 조회 돌리기
		int resultRowCount = userRepository.insert(insertDto);
		if (resultRowCount != 1) {
			System.out.println("회원가입 서비스 오류");
		}
		// 회원가입 id 검색
		int userId = userRepository.findIdOrderById(insertDto);
		
		// 등급 부여
		int result = userRepository.insertGrade(userId);
	}
	
	/**
	 *  멤버쉽 가입 서비스 (성희)
	 */
	public void createMembership(Integer id) {
		int resultRowCount = membershipRepository.insert(id);
		// 숙박 쿠폰 자동 등록 처리
		int couponCount = couponRepository.insert(id);
	}
}

