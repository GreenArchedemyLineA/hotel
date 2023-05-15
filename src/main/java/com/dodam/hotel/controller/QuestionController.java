package com.dodam.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 
 * @author 성희
 * 자주묻는 질문 controller
 *
 */
@Controller
public class QuestionController {
	
	@GetMapping("/question")
	public String questionPage( ) {
		return "/question/question";
	}
}
