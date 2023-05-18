package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
/**
 * 
 * @author 김현우
 *
 */
import com.dodam.hotel.repository.model.Question;
@Mapper
public interface QuestionRepository {
	
	// 질문 등록 처리
	public int insertQuestion(InsertQuestionRequestDto question);
	
	// 질문 조회 기능
	public List<Question> selectQuestionByUserId(Integer userId);
	
} // end of class
