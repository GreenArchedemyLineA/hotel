package com.dodam.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.dto.NoticeInsertForm;
import com.dodam.hotel.repository.model.Event;
import com.dodam.hotel.service.EventService;
import com.dodam.hotel.util.PagingObj;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;
	
	@GetMapping("/notice")
	public String eventNotice(Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required=false)String cntPerPage){
		int total = eventService.countEvent();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", eventService.findByEventAllPaging(obj));
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
	@PostMapping("/updateEvent/{id}")
	public String updateEvent(@PathVariable Integer id, NoticeInsertForm noticeInsertForm) {
		noticeInsertForm.setId(id);
		int event = eventService.updateEvent(noticeInsertForm);
		if (event == 0) {
			return null;
		}
		return "redirect:/event/notice";
	}
	@GetMapping("/deleteEvent/{id}")
	public String deleteEvent(@PathVariable Integer id) {
		int event = eventService.eventDelete(id);
		if(event == 0) {
			return null;
		}
		return "redirect:/event/notice";
	}
}
