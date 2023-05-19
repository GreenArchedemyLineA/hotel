package com.dodam.hotel.repository.interfaces;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.Coupon;

/**
 * 
 * @author 성희, 현우
 * 쿠폰 repository
 */
@Mapper
public interface CouponRepository {
	// 쿠폰 등록
	public int insert(Integer id);
	
	// 특정 회원 쿠폰 조회
	public List<Coupon> findByUserId(Integer userId);
	
}
