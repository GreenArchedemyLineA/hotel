package com.dodam.hotel.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
/**
 * 
 * @author 김현우
 *
 */
@Mapper
public interface QuestionRepository {
	
	// 질문 등록 처리
	public int insertQuestion(InsertQuestionRequestDto question);
	
} // end of class
