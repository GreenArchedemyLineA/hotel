package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.repository.interfaces.CouponRepository;
import com.dodam.hotel.repository.model.Coupon;

@Service
public class CouponService {
	
	@Autowired
	private CouponRepository couponRepository;
	
	public List<Coupon> readByUserId(Integer userId) {
		List<Coupon> couponEntity = couponRepository.findByUserId(userId);
		return couponEntity;
	}
	
} // end of class
