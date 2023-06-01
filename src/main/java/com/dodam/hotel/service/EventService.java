package com.dodam.hotel.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.NoticeInsertForm;
import com.dodam.hotel.repository.interfaces.EventRepository;
import com.dodam.hotel.repository.model.Event;
import com.dodam.hotel.util.PagingObj;

@Service
public class EventService {

	@Autowired
	EventRepository eventRepository;

	// 행사 일정 작성
	public int insertEvent(NoticeInsertForm noticeInsertForm) {
		int eventEntity = eventRepository.insert(noticeInsertForm);
		return eventEntity;
	}

	// 행사일정 리스트로 띠우기
//	 public List<Event> findByEventAll(){
//		 List<Event> eventListEntity = eventRepository.findByAll();
//		 return eventListEntity;
//	 }
	// 행사일정 리스트로 띠우기
	public List<Event> findByEventAllPaging(PagingObj obj) {
		List<Event> eventListEntity = eventRepository.findByAllPage(obj);
		return eventListEntity;
	}
	
	//행사 일정 리스트 숫자
	public Integer countEvent() {
		return eventRepository.count();
	}

	// 행사 일정 아이디 조회
	public Event findById(Integer id) {
		Event eventEntity = eventRepository.findById(id);
		return eventEntity;
	}

	// 행사 일정 수정
	public int updateEvent(NoticeInsertForm noticeInsertForm) {
		int eventUpdateEntity = eventRepository.updateEvent(noticeInsertForm);
		return eventUpdateEntity;
	}

	// 행사 일정 삭제
	public int eventDelete(Integer id) {
		int eventDeleteEntity = eventRepository.deleteById(id);
		return eventDeleteEntity;
	}
	
	// 진행중인 이벤트 조회 - 현우
	public List<Event> readOnGoingEvent(PagingObj obj) {
		List<Event> events = eventRepository.findNowEventByPage(obj);
		return events;
	}
	
	// 진행중인 이벤트 조회 - 현우
	public List<Event> readAllOnGoingEvent() {
		List<Event> events = eventRepository.findNowEvent();
		return events;
	}
	
	// 진행중인 리스트 숫자 - 현우
	public Integer countOnGoingEvent() {
		return eventRepository.findByNowAll();
	}
	
	// 종료된 이벤트 조회 - 현우
	public List<Event> readClosedEvent(PagingObj obj) {
		List<Event> events = eventRepository.findByPrevEventPage(obj);
		return events;
	}
	
	// 종료된 리스트 숫자 - 현우
	public Integer countClosedEvent() {
		return eventRepository.findByPrevAll();
	}
	
}
