package com.dodam.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.service.CouponService;
import com.dodam.hotel.util.Define;
import com.dodam.hotel.util.PagingObj;

@Controller
public class CouponController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CouponService couponService;
	
	@GetMapping("/couponList")
	public String couponList(Model model, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		int total = couponService.readCouponCount(principal.getId());
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "1";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "1";
		}
		
		PagingObj po = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(po);
		List<Coupon> coupons = couponService.readCouponByUserId(po, principal.getId());
		model.addAttribute("paging", po);
		model.addAttribute("coupons", coupons);
		
		return "/test";
	}
}
