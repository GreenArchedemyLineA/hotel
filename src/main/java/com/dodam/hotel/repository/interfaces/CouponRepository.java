package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.enums.CouponInfo;
import com.dodam.hotel.repository.model.Coupon;

/**
 * 
 * @author 성희, 현우
 * 쿠폰 repository
 */
@Mapper
public interface CouponRepository {
	// 쿠폰 등록
	public int insert(@Param("couponInfoId") CouponInfo couponInfoId, @Param("userId") Integer userId);
	
	// 특정 회원 쿠폰 조회
	public List<Coupon> findByUserId(Integer userId);
	
}
