package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.InquiryRequestDto;
import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.enums.CouponInfo;
import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.interfaces.GradeRepository;
import com.dodam.hotel.repository.interfaces.MUserRepository;
import com.dodam.hotel.repository.interfaces.MembershipRepository;
import com.dodam.hotel.repository.interfaces.PointRepository;
import com.dodam.hotel.repository.interfaces.UserRepository;
import com.dodam.hotel.repository.model.MembershipInfo;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.util.CreateRandomStr;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MUserRepository mUserRepository;

	@Autowired
	private MembershipRepository membershipRepository;

	@Autowired
	private CouponRepository couponRepository;

	@Autowired
	private GradeRepository gradeRepository;

	@Autowired
	private PointRepository pointRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Value("${dodam.key}")
	private String dodamKey;

	// 로그인용
	@Transactional
	public UserResponseDto.LoginResponseDto readUserByIdAndPassword(UserRequestDto.LoginFormDto user) {
		UserResponseDto.LoginResponseDto responseUser = userRepository.findUserByLoginFormDto(user);
		boolean isLogin = passwordEncoder.matches(user.getPassword(), responseUser.getPassword());
		if(isLogin != true) {
			// 예외처리
			return null;
		}
		if (responseUser.getBlacklist()) {
			// 블랙당한 user
			// 예외 처리
			return null;
		}
		if (responseUser.getWithdrawal()) {
			// 탈퇴한 유저
			// 예외처리
			return null;
		}

		return responseUser;
	}

	// 카카오 로그인 (성희)
	@Transactional
	public UserResponseDto.LoginResponseDto readUserKakao(String email) {
		UserResponseDto.LoginResponseDto responseUser = userRepository.findUserKakao(email);
		if (responseUser != null) {
			if (responseUser.getSocialLogin() == false) {
				// 일반회원 예외처리
				return null;
			}
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
		responseDto.setName(userEntity.getName());
		responseDto.setGender(userEntity.getGender());
		responseDto.setBirth(userEntity.getBirth());
		responseDto.setTel(userEntity.getTel());
		responseDto.setAddress(userEntity.getAddress());
		return responseDto;
	}
	
	// 아이디 중복검사
	@Transactional
	public User readUserForDuplicationCheck(String email) {
		User userEntity = userRepository.findUserByEmail(email);
		return userEntity;
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
	 * 회원가입 서비스 (성희)
	 */
	@Transactional
	public UserRequestDto.InsertDto createUser(UserRequestDto.InsertDto insertDto) {
		// 중복 회원가입 검사 (todo)
		
		// 탈퇴한 유저인지 조회
		User userEntity = userRepository.findUserByOriginEmail(insertDto.getEmail());
		if(userEntity == null) {
			// 조회 돌리기
			// 비밀번호 암호화
			String hashPwd = passwordEncoder.encode(insertDto.getPassword());
			insertDto.setPassword(hashPwd);
			int resultRowCount = userRepository.insert(insertDto);
			if (resultRowCount != 1) {
				System.out.println("회원가입 서비스 오류");
			}
			// 회원가입 id 검색
			int userId = userRepository.findIdOrderById(insertDto);
	
			// 등급 부여
			int result = gradeRepository.insertGrade(userId);
	
			// 포인트 세팅
			int pointResult = pointRepository.insertZeroPoint(userId);
		} else {
			// 비밀번호 암호화
			String hashPwd = passwordEncoder.encode(insertDto.getPassword());
			insertDto.setPassword(hashPwd);
			int result = userRepository.updateUserByOriginEmail(insertDto);
			if(result != 1) {
				// 오류
			}
		}
		return insertDto;
	}

	/**
	 * 카카오 회원가입 서비스 (성희)
	 */
	@Transactional
	public UserRequestDto.InsertDto createUserKakao(UserRequestDto.InsertDto insertDto) {
		// 중복 회원가입 검사 (todo)
		
		// 카카오 임시 비밀번호 세팅
		insertDto.setPassword(dodamKey);
		
		int resultRowCount = userRepository.insertKakao(insertDto);
		if (resultRowCount != 1) {
			System.out.println("회원가입 서비스 오류");
		}
		// 회원가입 id 검색
		int userId = userRepository.findIdOrderById(insertDto);

		// 등급 부여
		int result = gradeRepository.insertGrade(userId);

		// 포인트 세팅
		int pointResult = pointRepository.insertZeroPoint(userId);

		return insertDto;
	}
	
	// 회원 탈퇴 서비스 (성희)
	@Transactional
	public int deleteUser(UserRequestDto.MyPageFormDto user) {
		int resultRowCount = 0;
		if(user.getOriginEmail() == null) {
			// 랜덤 문자열 생성
			String randomStr = CreateRandomStr.createRandomString();
			// 원래 이메일 -> 랜덤문자열 이메일로 변경
			user.setEmail(randomStr+"-"+user.getEmail());
			// origin email 저장
			user.setOriginEmail(user.getEmail());
			resultRowCount = userRepository.deleteUser(user);
			
		} else {
			// 예외처리
		}
		return resultRowCount;
	}

	// 오늘 회원가입 회원 조회
	@Transactional
	public List<User> readJoinUserToday() {
		List<User> UserToday = userRepository.findUserToday();
		return UserToday;
	}

	/**
	 * 멤버쉽 가입 서비스 (성희)
	 */
	@Transactional
	public void createMembership(Integer id) {
		int resultRowCount = membershipRepository.insert(id);
		// 숙박 쿠폰 자동 등록 처리
		int couponCount = couponRepository.insert(CouponInfo.MEMBERSHIP, id);
	}

	// 오늘 멤버쉽 가입 회원 조회
	@Transactional
	public List<MembershipInfo> readJoinMembershipToday() {
		List<MembershipInfo> membershipToday = membershipRepository.findMembershipToday();
		return membershipToday;
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
		// 비밀번호 암호화 처리
		password = passwordEncoder.encode(password);
		int resultRow = userRepository.updateOnlyPw(password, userId);
		if (resultRow == 1) {
			// 임시 비밀번호 발급 여부 업데이트
			int resultRow2 = userRepository.updatePwdStatus(userId);
			if (resultRow2 != 1) {
				// 예외처리
			}
		}
		return resultRow;
	}
	
}
