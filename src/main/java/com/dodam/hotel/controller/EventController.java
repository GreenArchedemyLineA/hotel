package com.dodam.hotel.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.handler.exception.CustomRestFullException;
import com.dodam.hotel.handler.exception.ManagerCustomRestFullException;
import com.dodam.hotel.dto.EventInsertForm;
import com.dodam.hotel.repository.model.Event;
import com.dodam.hotel.service.EventService;
import com.dodam.hotel.util.PagingObj;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 매니저 notice
	@GetMapping("/notice")
	public String eventNotice(Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required=false)String cntPerPage){
		int total = eventService.readEventCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Event> responseEvents = eventService.readByEventAllPaging(obj);
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", responseEvents);
		return "/board/eventNotice"; 
	}
	
	// 진행중인 이벤트 페이지
	@GetMapping("/eventBoard/onGoing")
	public String onGoingEventBoard(Model model, 
			@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "4", required=false)String cntPerPage) {
		int total = eventService.onGoingEventCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Event> responseEvents = eventService.readOnGoingEvent(obj);
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", responseEvents);
		return "/user/onGoingEvent";
	}
	
	// 종료된 이벤트 페이지
	@GetMapping("/eventBoard/closed")
	public String closedEventBoard(Model model, 
			@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "4", required=false)String cntPerPage) {
		int total = eventService.closedEventCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Event> responseEvents = eventService.readClosedEvent(obj);
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", responseEvents);
		return "/user/closedEvent";
	}
	
	// 매니저 insert
	@PostMapping("/event-insert")
	public String eventWrite(@Validated EventInsertForm eventInsertForm, BindingResult bindingResult) {
	if(bindingResult.hasErrors()) {
		bindingResult.getAllErrors().forEach(e -> {
			throw new ManagerCustomRestFullException(e.getDefaultMessage(), HttpStatus.BAD_REQUEST);
		});
	}
		eventService.insertEvent(eventInsertForm);
		return "redirect:/event/notice";
	}
	
	// 매니저 이벤트 수정
	@GetMapping("/updateEventPage/{id}")
	public String updateEventPage(@PathVariable Integer id,Model model) {
		if(id == null) {
    		throw new ManagerCustomRestFullException("아이디가 입력되지 않았습니다.", HttpStatus.BAD_REQUEST);
    	}
		Event responseEvent = eventService.readById(id);
		model.addAttribute("event", responseEvent);
		return "/board/eventUpdatePage";
	}
	
	// 매니저 이벤트 수정
	@PostMapping("/updateEvent/{id}")
	public String updateEvent(@PathVariable Integer id, @Validated EventInsertForm eventInsertForm, BindingResult bindingResult) {
		if(id == null) {
			throw new ManagerCustomRestFullException("아이디가 입력되지 않았습니다.", HttpStatus.BAD_REQUEST);
		}
		if(bindingResult.hasErrors()) {
			bindingResult.getAllErrors().forEach(e -> {
				throw new ManagerCustomRestFullException(e.getDefaultMessage(), HttpStatus.BAD_REQUEST);
			});
		}
		eventInsertForm.setId(id);
		eventService.updateEvent(eventInsertForm);
		return "redirect:/event/notice";
	}
	
	// 매니저 이벤트 삭제
	@GetMapping("/deleteEvent/{id}")
	public String deleteEvent(@PathVariable Integer id) {
		if(id == null) {
    		throw new ManagerCustomRestFullException("아이디가 입력되지 않았습니다.", HttpStatus.BAD_REQUEST);
    	}
		eventService.deleteEvent(id);
		return "redirect:/event/notice";
	}
}
