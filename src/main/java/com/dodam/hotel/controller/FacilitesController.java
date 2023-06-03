package com.dodam.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dodam.hotel.repository.model.Fitness;
import com.dodam.hotel.repository.model.Pool;
import com.dodam.hotel.repository.model.Spa;
import com.dodam.hotel.service.FacilitiesService;

/**
 * 
 * @author 성희 부대시설 controller
 *
 */
@Controller
public class FacilitesController {

	@Autowired
	private FacilitiesService facilitiesService;

	// 부대시설 페이지
	@GetMapping("/facilities")
	public String facilitesPage(Model model) {
		Pool pool = facilitiesService.readPoolAll();
		Spa spa = facilitiesService.readSpaAll();
		Fitness fitness = facilitiesService.readFitnessAll();
		model.addAttribute("pool", pool);
		model.addAttribute("spa", spa);
		model.addAttribute("fitness", fitness);
		return "/facilities/info";
	}

	// 수영장 페이지
	@GetMapping("/pool")
	public String poolPage(Model model) {
		Pool pool = facilitiesService.readPoolAll();
		model.addAttribute("pool", pool);
		return "/facilities/pool";
	}

	// 스파 페이지
	@GetMapping("/spa")
	public String spaPage(Model model) {
		Spa spa = facilitiesService.readSpaAll();
		model.addAttribute("spa", spa);
		return "/facilities/spa";
	}

	// 피트니스 페이지
	@GetMapping("/fitness")
	public String fitnessPage(Model model) {
		Fitness fitness = facilitiesService.readFitnessAll();
		model.addAttribute("fitness", fitness);
		return "/facilities/fitness";
	}
	

}
