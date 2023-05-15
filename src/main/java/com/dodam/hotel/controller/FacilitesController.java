package com.dodam.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
/**
 * 
 * @author 성희
 * 부대시설 controller
 *
 */
@Controller
public class FacilitesController {
	
	// 부대시설 페이지
	@GetMapping("/facilites")
	public String facilitesPage() {
		return "/facilites/facilites";
	}
}
