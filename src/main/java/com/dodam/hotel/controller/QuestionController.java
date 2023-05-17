package com.dodam.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dodam.hotel.repository.model.TestQuestion;
import com.dodam.hotel.repository.model.TestReply;
import com.dodam.hotel.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	//문의사항 계시판
	@GetMapping("/questionList")
	public String questionList(Model model) {
		//주소 요청시 작성된 계시물 제목 List 로 다불러오기
		List<TestQuestion> questionList = questionService.findAllQuestionList();
		System.out.println(questionList);
		if(questionList != null) {
			model.addAttribute("questionList",questionList);
		}
		return "/board/question";
	}
	
	@GetMapping("/questionDetail/{id}")
	public String questionDetail(@PathVariable Integer id,Model model) {
		TestQuestion question = questionService.findById(id);
		System.out.println(question);
		if(question != null) {
			model.addAttribute("question",question);
		}
		return "/board/questionDetail";
	}
	
	@PostMapping("/reply/{questionId}/{managerId}")
	@Transactional
	public String insertReply(String content,@PathVariable Integer questionId,@PathVariable Integer managerId) {
		int questionStatus = questionService.updateStatusById(questionId);
		int insertReply = questionService.insertReply(content, questionId, managerId);
		return "redirect:/question/questionList";
	}
	
	@GetMapping("questionDelete")
	public String questionDelete(){
		return null;
	}
}
