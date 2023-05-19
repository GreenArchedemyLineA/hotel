package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.model.Faq;
/**
 * 
 * @author 김현우
 *
 */
import com.dodam.hotel.repository.model.Question;
import com.dodam.hotel.repository.model.Reply;
@Mapper
public interface QuestionRepository {
	
	// 질문 등록 처리
	public int insertQuestion(InsertQuestionRequestDto question);
	
	// 질문 조회 기능
	public List<Reply> selectQuestionByUserId(Integer userId);
	
	// 모든 faq 조회
	public List<Faq> selectAllFaq();
	
} // end of class
