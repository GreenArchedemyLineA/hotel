package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.dto.UserListDto;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;

@Mapper
public interface MUserRepository {
	
	public int updateGrade(@Param("gradeId") Integer gradeId,@Param("id") Integer id);
	public List<MUser> findByname(String name);
	public List<MUser> findByBlackList(int blackList);
	public GradeInfo findByUserId(Integer id);
	
}
