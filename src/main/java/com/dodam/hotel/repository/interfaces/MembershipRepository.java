package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.MembershipInfo;

@Mapper
public interface MembershipRepository {
	
	// 멤버쉽 등록
	public int insert(Integer id);
	
	// 오늘 멤버쉽 등록 조회
	public List<MembershipInfo> findMembershipToday();
}
