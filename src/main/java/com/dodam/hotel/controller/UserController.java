package com.dodam.hotel.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.Reply;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.CouponService;
import com.dodam.hotel.service.GradeService;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;

import com.dodam.hotel.dto.TestDto;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private QuestionService questionService;
	
	// 메인 페이지 (성희)
	@GetMapping({"","/"})
	public String mainPage() {
		return "/main";
	}
	
	// 로그인 페이지 (현우)
	@GetMapping("/login")
	public String loginPage() {
		return "/user/login";
	}
	
	// 내정보 페이지 (현우)
	@GetMapping("/myPage")
	public String myPage(Model model) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		// 회원 정보 불러오기
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		// 등급 정보 불러오기
		GradeInfo responseGrade = gradeService.readGradeByUserId(principal.getId());
		// todo
		// 비동기처리 -> restController로 이동
		// 쿠폰 정보 불러오기 
		List<Coupon> coupons = couponService.readByUserId(principal.getId());
		// todo
		// 비동기처리 -> restController로 이동
		// 예약 정보 불러오기
		List<Reservation> reservations = reservationService.readAllReservationByUserId(principal.getId());
		// 내가 한 질문 리스트 가져오기
		// todo
		// 비동기처리 -> restController로 이동
		List<Reply> qna = questionService.readQuestionByUserId(principal.getId());
		model.addAttribute("responseUser", responseUser);
		model.addAttribute("responseGrade", responseGrade);
		model.addAttribute("coupons", coupons);
		model.addAttribute("reservations", reservations);
		model.addAttribute("qna", qna);
		return "/user/myPage";
	}
	
	// 로그인 기능 구현 (현우)
	@PostMapping("/loginProc")
	public String loginProc(UserRequestDto.LoginFormDto loginDto) {
		UserResponseDto.LoginResponseDto principal = userService.readUserByIdAndPassword(loginDto);
		session.setAttribute(Define.PRINCIPAL, principal);
		return "redirect:/myPage";
	}
	
	// 회원정보 수정 처리 (김현우)
	@PostMapping("/myPageProc")
	public String myPageProc(UserRequestDto.MyPageFormDto myPageDto) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
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
	public String membershipPage() {
		return "/membership/membership";
	}
	
	// 멤버쉽 가입 처리 (성희)
	@GetMapping("/joinMembership")
	public String membership() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		userService.createMembership(responseUser.getId());
		return "redirect:/";
	}
	
	// 아이디, 비밀번호 찾기
	@GetMapping("/findIdPw")
	public String findIdPw() {
		return "/user/inquiry";
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
