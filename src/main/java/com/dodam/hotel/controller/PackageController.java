package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 
 * @author 성희
 * 패키지 controller
 */
import org.springframework.web.bind.annotation.GetMapping;

import com.dodam.hotel.dto.PackageDto;
import com.dodam.hotel.service.PackageService;
@Controller
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	// 패키지 페이지
	@GetMapping("/package")
	public String packagePage(Model model) {
		List<PackageDto> h_package = packageService.readPackageAll();
		for (int i = 0; i < h_package.size(); i++) {
			System.out.println(h_package.get(i));
		}
		model.addAttribute("h_package", h_package);
		return "/room/package";
	}
}
