package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.dto.NoticeInsertForm;
import com.dodam.hotel.page.Criteria;
import com.dodam.hotel.page.PagingResponse;
import com.dodam.hotel.page.PagingVO;
import com.dodam.hotel.repository.model.Event;
import com.dodam.hotel.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;
	
	@GetMapping("/notice")
	public String eventNotice(PagingVO vo,Model model
			,@RequestParam(value ="nowPage" , required = false)String nowPage
			,@RequestParam(value="cntPerPage", required=false)String cntPerPage){
		int total = eventService.countEvent();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}	
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(eventService.findByEventAllPaging(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", eventService.findByEventAllPaging(vo));
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
