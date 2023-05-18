package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.interfaces.QuestionRepository;
/**
 * 
 * @author 김현우
 *
 */
import com.dodam.hotel.repository.model.Question;
@Service
public class QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	// 질문 등록 처리 (현우)
	public void createQuestion(InsertQuestionRequestDto question) {
		int resultRow = questionRepository.insertQuestion(question);
		if(resultRow != 1) {
			// 예외처리
			System.out.println("등록 실패");
		}
	}
	
	// 질문 조회 기능
	public List<Question> readQuestionByUserId(Integer userId) {
		List<Question> questionEntitys = questionRepository.selectQuestionByUserId(userId);
		return questionEntitys;
	}
	
} // end of class
