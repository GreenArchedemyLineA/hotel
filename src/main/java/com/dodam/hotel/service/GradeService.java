package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.repository.interfaces.GradeRepository;
import com.dodam.hotel.repository.model.GradeInfo;

@Service
public class GradeService {
	
	@Autowired
	private GradeRepository gradeRepository;
	
	// myPage 회원 등급 조회하는 용도
	public GradeInfo readGradeByUserId(Integer userId) {
		GradeInfo gradeInfoEntity = gradeRepository.findGradeByUserId(userId);
		return gradeInfoEntity;
	}
	
} // end of class
