package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.interfaces.QuestionRepository;
import com.dodam.hotel.repository.model.Faq;
/**
 * 
 * @author 김현우
 *
 */
import com.dodam.hotel.repository.model.Question;
import com.dodam.hotel.repository.model.Reply;
@Service
public class QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	// 질문 등록 처리 (현우)
	@Transactional
	public void createQuestion(InsertQuestionRequestDto question) {
		int resultRow = questionRepository.insertQuestion(question);
		if(resultRow != 1) {
			// 예외처리
			System.out.println("등록 실패");
		}
	}
	
	// 모든 자주 묻는 질문 조회
	public List<Faq> readAllFaq() {
		List<Faq> faqEntitys = questionRepository.selectAllFaq();
		return faqEntitys;
	}
	
	// 질문 조회 기능
	@Transactional
	public List<Reply> readQuestionByUserId(Integer userId) {
		List<Reply> questionEntitys = questionRepository.selectQuestionByUserId(userId);
		return questionEntitys;
	}
	
} // end of class
