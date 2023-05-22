package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.InquiryRequestDto;
import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.interfaces.GradeRepository;
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
	
	@Autowired
	private GradeRepository gradeRepository; 
	
	// 로그인용
	@Transactional
	public UserResponseDto.LoginResponseDto readUserByIdAndPassword(UserRequestDto.LoginFormDto user) {
		UserResponseDto.LoginResponseDto responseUser = userRepository.findUserByLoginFormDto(user);
		System.out.println(responseUser);
		if(responseUser.getBlacklist()) {
			// 블랙당한 user
			// 예외 처리
			System.out.println("111111111111111111111");
			return null;
		}
		if(responseUser.getWithdrawal()) {
			// 탈퇴한 유저
			// 예외처리
			System.out.println("222222222222222222");
			return null;
		}
		return responseUser;
	}
	
	// 내정보 페이지에 회원 정보 출력
	@Transactional
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
	
	// 회원 정보 수정
	@Transactional
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
		int result = gradeRepository.insertGrade(userId);
		
	}
	
	/**
	 *  멤버쉽 가입 서비스 (성희)
	 */
	@Transactional
	public void createMembership(Integer id) {
		int resultRowCount = membershipRepository.insert(id);
		// 숙박 쿠폰 자동 등록 처리
		int couponCount = couponRepository.insert(id);
	}
	
	// id 찾는 기능
	@Transactional
	public User readUserForIdInquiry(InquiryRequestDto.IdInquiryRequestDto idInquiryRequestDto) {
		User userEntity = userRepository.findUserForIdInquiry(idInquiryRequestDto);
		return userEntity;
	}
	
	// 임시 pw update 처리
	@Transactional
	public int updatePwByUserInfo(InquiryRequestDto.PwInquiryRequestDto pwInquiryRequestDto) {
		int resultRow = userRepository.updatePwByUserInfo(pwInquiryRequestDto);
		return resultRow;
	}
	
	// 비밀번호 변경 페이지에서 비밀번호 변경
	@Transactional
	public int updateOnlyPw(String password, Integer userId) {
		int resultRow = userRepository.updateOnlyPw(password, userId);
		if(resultRow == 1) {
			int resultRow2 = userRepository.updatePwdStatus(userId);
			if(resultRow2 != 1) {
				// 예외처리
			}
		}
		return resultRow;
	}
}

