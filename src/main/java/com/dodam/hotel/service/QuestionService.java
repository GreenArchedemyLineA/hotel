package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.repository.interfaces.QuestionRepository;
import com.dodam.hotel.repository.interfaces.ReplyRepository;
import com.dodam.hotel.repository.model.TestQuestion;
import com.dodam.hotel.repository.model.TestReply;

@Service
public class QuestionService {

	@Autowired
	private QuestionRepository questionRepository;
	@Autowired
	private ReplyRepository replyRepository;
	
	
	public List<TestQuestion> findAllQuestionList(){
		List<TestQuestion> questionListEntity = questionRepository.findAllQuestion(); 
		return questionListEntity;
	}
	
	public TestQuestion findById(Integer id) {
		TestQuestion questionEntity = questionRepository.findById(id);
		return questionEntity;
	}
	// 댓글 상태값 변경
	public int updateStatusById(Integer id) {
		int updateStatusEntity = questionRepository.updateById(id);
		return updateStatusEntity;
	}
	//댓긓작성
	public int insertReply(String content,Integer questionId,Integer managerId) {
		int insertReplyEntity = replyRepository.insert(content, questionId, managerId); 
		return insertReplyEntity; 
	}
	
}
