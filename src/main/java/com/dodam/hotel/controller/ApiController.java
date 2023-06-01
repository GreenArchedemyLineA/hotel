package com.dodam.hotel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.repository.model.Reply;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.service.CouponService;
import com.dodam.hotel.service.ManagerReservationService;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;
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
	
	// 쿠폰 리스트 확인
	@GetMapping("/myCoupon")
	public List<Coupon> myCoupon() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		List<Coupon> coupons = couponService.readByUserId(principal.getId());
		return coupons;
	}
	
	// 예약 정보 확인
	@GetMapping("/myReservation")
	public List<Reservation> myReservation() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		List<Reservation> reservations = reservationService.readAllReservationByUserId(principal.getId());
		return reservations;
	}
	
	// 내가 한 질문들 확인
	@GetMapping("/myReply")
	public List<Reply> myReply() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		List<Reply> qna = questionService.readQuestionByUserId(principal.getId());
		return qna;
	}
	
	
	/**
	 *  성희
	 *  구글 차트 ajax 작업
	 */
	// 매출 조회
	@RequestMapping(value="/totalPrice")
	@ResponseBody
	public List<Integer> totalPrice() {
	    int totalPrice = managerReservationService.readBeforeTodayTotalPrice();
	    List<Integer> price = new ArrayList<>();
	    for (int i = 6; i > 0; i--) {
	        Integer beforeTotalPrice = managerReservationService.readBeforeTotalPrice(i);
	        if (beforeTotalPrice == null) {
	            beforeTotalPrice = 0;
	        }
	        price.add(beforeTotalPrice);
	    }
	    price.add(totalPrice);
 
	    for (int i = 0; i < price.size(); i++) {
			System.out.println(price);
		}
	    return price;
	}
	/*
	 * @GetMapping("/totalPrice") public List<Integer> totalPrice() { int totalPrice
	 * = managerReservationService.readBeforeTodayTotalPrice(); List<Integer> price
	 * = new ArrayList<>(); for (int i = 1; i < 7; i++) { Integer beforetotalPrice =
	 * managerReservationService.readBeforeTotalPrice(i); if (beforetotalPrice ==
	 * null) { beforetotalPrice = 0; } price.add(beforetotalPrice); }
	 * price.add(totalPrice); return price; }
	 */
} // end of class
