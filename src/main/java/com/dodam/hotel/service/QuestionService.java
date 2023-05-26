package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.interfaces.QuestionRepository;
import com.dodam.hotel.repository.interfaces.ReplyRepository;
import com.dodam.hotel.repository.model.FAQ;
import com.dodam.hotel.repository.model.Reply;
import com.dodam.hotel.repository.model.TestQuestion;
import com.dodam.hotel.util.PagingObj;
@Service
public class QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	// 질문 등록 처리 (현우)
	@Transactional
	public void createQuestion(InsertQuestionRequestDto question) {
		int resultRow = questionRepository.insertQuestion(question);
		if(resultRow != 1) {
			// 예외처리
			System.out.println("등록 실패");
		}
	}
	
	// 특정 유저 모든 질문 개수
	public int readQuestionCountByUserId(Integer userId) {
		int resultCount = questionRepository.findByUserIdCount(userId);
		return resultCount;
	}
	
	// 특정 유저 질문 조회(페이징)
	public List<Reply> readQuestionByUserIdPaging(PagingObj obj, Integer userId) {
		List<Reply> replyEntitys = questionRepository.findByUserIdPaging(obj, userId);
		return replyEntitys;
	}
	
	// 모든 자주 묻는 질문 조회
	@Transactional
	public List<FAQ> readAllFaq() {
		List<FAQ> faqEntitys = questionRepository.selectAllFaq();
		return faqEntitys;
	}
	
	// 특정 유저 질문 조회 기능
	@Transactional
	public List<Reply> readQuestionByUserId(Integer userId) {
		List<Reply> questionEntitys = questionRepository.selectQuestionByUserId(userId);
		return questionEntitys;
	}

	// 문의 전부 보기
	public List<TestQuestion> findAllQuestionList(){
		List<TestQuestion> questionListEntity = questionRepository.findAllQuestion(); 
		return questionListEntity;
	}
	// 문의 아이디로 검색후 상세보기
	public TestQuestion findById(Integer id) {
		TestQuestion questionEntity = questionRepository.findById(id);
		return questionEntity;
	}
	// 댓글 상태값 변경
	public int updateStatusById(Integer id) {
		int updateStatusEntity = questionRepository.updateById(id);
		return updateStatusEntity;
	}
	//댓글작성
	public int insertReply(String content,Integer questionId,Integer managerId) {
		int insertReplyEntity = replyRepository.insert(content, questionId, managerId); 
		return insertReplyEntity; 
	}
	// 문의 카테고리로 검색
	public List<TestQuestion> findByCategory(String category){
		List<TestQuestion> questionCategoryEntity = questionRepository.findByCategory(category);
		return questionCategoryEntity;
	}
}
