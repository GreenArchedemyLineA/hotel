package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.InsertReplyDto;
import com.dodam.hotel.repository.model.TestQuestion;
import com.dodam.hotel.repository.model.TestReply;


@Mapper
public interface QuestionRepository {
	
	public List<TestReply> findAll();
	public int insert(InsertReplyDto insertReplyDto);
	public List<TestQuestion> findAllQuestion();
	public TestQuestion findById(Integer id);
	public int updateById(Integer id); 
	public List<TestQuestion> findByCategory(String category);
}
