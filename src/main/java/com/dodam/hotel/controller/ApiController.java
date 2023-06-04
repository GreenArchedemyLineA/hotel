package com.dodam.hotel.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.dto.api.ResponseMsg;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.repository.model.MembershipInfo;
import com.dodam.hotel.repository.model.Reply;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.CouponService;
import com.dodam.hotel.service.ManagerReservationService;
import com.dodam.hotel.service.ManagerService;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;
import com.dodam.hotel.util.PagingObj;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ManagerReservationService managerReservationService;
	
	// 회원 정보 수정용
	@GetMapping("/myInfo")
	public UserResponseDto.MyPageResponseDto updateUserInfo() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		// 회원 정보 불러오기
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		
		return responseUser;
	}
	
	/**
	 *  성희
	 *  구글 차트 ajax 작업
	 */
	// 매출 조회
	@GetMapping("/totalPrice")
	public List<Integer> totalPrice() {
	    Integer totalPrice = managerReservationService.readBeforeTodayTotalPrice();
	    List<Integer> price = new ArrayList<>();
	    for (int i = 6; i > 0; i--) {
	        Integer beforeTotalPrice = managerReservationService.readBeforeTotalPrice(i);
	        if (beforeTotalPrice == null) {
	            beforeTotalPrice = 0;
	        }
	        price.add(beforeTotalPrice);
	    }
	    price.add(totalPrice);
	    return price;
}
	
	// 회원가입 / 멤버쉽가입 카운트 조회 (성희)
	@GetMapping("/joinCount")
	public List<Integer> joinCount() {
		List<User> userToday = userService.readJoinUserToday();
		Integer memberCount = userToday.size();
		List<MembershipInfo> membershipToday = userService.readJoinMembershipToday();
		Integer membershipCount = membershipToday.size();
		
		List<Integer> countBox = new ArrayList<>();
		countBox.add(memberCount);
		countBox.add(membershipCount);
		
		return countBox;
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
	
	// 예약조회  (성희)
	@GetMapping("/reserve")
	public List<Reservation> reserveDetail(Integer id) {		
			List<Reservation> reservations = reservationService.readAllReservationByUserId(id);
			return reservations;
		}
	
	// 예약 전체 조회
	@GetMapping("/allReserve")
	public List<Reservation> reservation() {
		List<Reservation> reservations = managerReservationService.findAllReservation();
		return reservations;
	}
} // end of class
