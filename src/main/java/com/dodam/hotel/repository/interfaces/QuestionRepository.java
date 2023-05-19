package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.InsertReplyDto;
import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.model.FAQ;
import com.dodam.hotel.repository.model.Reply;
import com.dodam.hotel.repository.model.TestQuestion;
import com.dodam.hotel.repository.model.TestReply;
@Mapper
public interface QuestionRepository {
	
	// 질문 등록 처리
	public int insertQuestion(InsertQuestionRequestDto question);
	
	// 질문 조회 기능
	public List<Reply> selectQuestionByUserId(Integer userId);
	
	// 모든 faq 조회
	public List<FAQ> selectAllFaq();
	public List<TestReply> findAll();
	public int insert(InsertReplyDto insertReplyDto);
	public List<TestQuestion> findAllQuestion();
	public TestQuestion findById(Integer id);
	public int updateById(Integer id); 
	public List<TestQuestion> findByCategory(String category);
	
} // end of class
