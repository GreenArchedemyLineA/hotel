package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * @author 성희
 * 쿠폰 repository
 */
@Mapper
public interface CouponRepository {
	
	public int insert(Integer id);
}
