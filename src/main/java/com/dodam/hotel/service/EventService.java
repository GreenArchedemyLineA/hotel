package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.NoticeInsertForm;
import com.dodam.hotel.repository.interfaces.EventRepository;
import com.dodam.hotel.repository.model.Event;

@Service
public class EventService {
	
	@Autowired
	EventRepository eventRepository;
	//행사 일정 작성
	public int insertEvent(NoticeInsertForm noticeInsertForm) {
		int eventEntity = eventRepository.insert(noticeInsertForm);
		return eventEntity;
	}
	//행사일정 리스트로 띠우기
	 public List<Event> findByEventAll(){
		 List<Event> eventListEntity = eventRepository.findByAll();
		 return eventListEntity;
	 }
	 //행사 일정 아이디 조회
	 public Event findById(Integer id) {
		 Event eventEntity = eventRepository.findById(id);
		 return eventEntity;
	 }
	 //행사 일정 수정
	 public int updateEvent(NoticeInsertForm noticeInsertForm) {
		int eventUpdateEntity = eventRepository.updateEvent(noticeInsertForm);
		return eventUpdateEntity;
	 }
	 //행사 일정 삭제
	 public int eventDelete(Integer id) {
		 int eventDeleteEntity = eventRepository.deleteById(id);
		 return eventDeleteEntity;
	 }
}
