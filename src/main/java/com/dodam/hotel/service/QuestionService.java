package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.interfaces.QuestionRepository;
/**
 * 
 * @author 김현우
 *
 */
@Service
public class QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	// 질문 등록 처리 (현우)
	public void createQuestion(InsertQuestionRequestDto question) {
		int resultRow = questionRepository.insertQuestion(question);
		System.out.println(resultRow);
		if(resultRow != 1) {
			// 예외처리
			System.out.println("등록 실패");
		}
	}
	
} // end of class
