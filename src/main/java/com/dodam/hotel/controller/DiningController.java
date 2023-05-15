package com.dodam.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DiningController {
	
	@GetMapping("/dining")
	public String diningPage() {
		return "/dining/dining";
	}
}
