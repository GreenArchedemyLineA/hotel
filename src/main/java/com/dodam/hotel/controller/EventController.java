package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dodam.hotel.dto.NoticeInsertForm;
import com.dodam.hotel.repository.model.Event;
import com.dodam.hotel.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;
	
	@GetMapping("/notice")
	public String eventNotice(Model model) {
		List<Event> event = eventService.findByEventAll();
		if(event != null) {
			model.addAttribute("eventList", event);
		}
		return "/board/eventNotice"; 
	}
	
	@PostMapping("/event-insert")
	public String eventWrite(NoticeInsertForm noticeInsertForm) {
		int event = eventService.insertEvent(noticeInsertForm);
		if (event == 0) {
			return null;
		}
		return "redirect:/event/notice";
	}
	
	@GetMapping("/updateEventPage/{id}")
	public String updateEventPage(@PathVariable Integer id,Model model) {
		Event event = eventService.findById(id);
		System.out.println(event);
		if (event != null) {
			model.addAttribute("event", event);
		}
		return "/board/eventUpdatePage";
	}
	@PostMapping("/updateEvent")
	public String updateEvent(NoticeInsertForm noticeInsertForm) {
		int event = eventService.updateEvent(noticeInsertForm);
		if (event == 0) {
			return null;
		}
		return "redirect:/event/notice";
	}
}
