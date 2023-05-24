package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.MembershipInfo;

@Mapper
public interface MUserRepository {
	//등급 수정
	public int updateGrade(@Param("gradeId") Integer gradeId,@Param("id") Integer id);
	public List<MUser> findByAll();
	//유저 리스트 조회 페이징
	//게시글수 카운팅
	public List<MUser> findByname(String name);
	public List<MUser> findByBlackList();
	public GradeInfo findByUserId(Integer id);
	public int deleteBlackList(Integer id);
	//블랙리스트 지정
	public int updateBlackList(Integer id);
	//블랙리스트 해제
	public int updateWhiteList(Integer id);
	//탈퇴 처리
	public int updateWithdrawal(Integer id);
	//탈퇴처리 된 회원의 원래 메일 저장
	public int updateOriginEmail(@Param("email") String email,@Param("id") Integer id);
	
	public int updateWithdrawalEmail(@Param("email") String email,@Param("id") Integer id);
	//등급별 회원 조회
	public List<GradeInfo> findByGradeAll(Integer gradeId);
	//맴버쉽 회원조회
	public List<MembershipInfo> findByMembershipAll();
}
