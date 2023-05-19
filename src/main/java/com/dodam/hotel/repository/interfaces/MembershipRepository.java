package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembershipRepository {
	
	// 멤버쉽 등록
	public int insert(Integer id);
}
