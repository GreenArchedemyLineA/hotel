package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.UserListDto;
import com.dodam.hotel.repository.model.MUser;

@Mapper
public interface MUserRepository {
	
	public int updateGradeByUsernameAndTel();
	public List<MUser> findByname(String name);
	
}
