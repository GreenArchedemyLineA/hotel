package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.dto.NoticeInsertForm;
import com.dodam.hotel.repository.model.Event;

@Mapper
public interface EventRepository {
	
	public int insert(NoticeInsertForm noticeInsertForm);
	public List<Event> findByAll();
	public Event findById(Integer id);
	public int updateEvent(NoticeInsertForm noticeInsertForm);
	public int deleteById(Integer id);
	
}
