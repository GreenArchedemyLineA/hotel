package com.dodam.hotel.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.Faq;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.util.Define;

/**
 * 
 * @author 현우
 * faq, 문의 controller
 *
 */
@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private HttpSession session;
	
	// faq로 이동
	@GetMapping("/question")
	public String questionPage(Model model) {
		List<Faq> faqList = questionService.readAllFaq();
		model.addAttribute("faqList", faqList);
		return "/question/question";
	}
	
	// qna 페이지 이동 (현우)
	@GetMapping("/qnaPage")
	public String qnaPage() {
		return "/user/qna";
	}
	
	// qna 등록 처리
	@PostMapping("/qnaProc")
	public String qnaProc(InsertQuestionRequestDto question) {
		
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		
		question.setUserId(principal.getId());
		
		MultipartFile file = question.getFile();
		if(file.isEmpty() ==false) {
			
			// 파일 최대 크기 지정 -- 추후 추가 예정
			try {
				String saveDirectory = Define.UPLOAD_DIRECTORY;
				File dir = new File(saveDirectory);
				
				if(dir.exists() == false) {
					dir.mkdirs();
				}
				
				UUID uuid = UUID.randomUUID();
				String fileName = uuid + "_" + file.getOriginalFilename();
				String uploadPath = Define.UPLOAD_DIRECTORY + File.separator + fileName;
				
				File destination = new File(uploadPath);
				file.transferTo(destination);
				
				question.setOriginFile(file.getOriginalFilename());
				question.setUploadFile(fileName);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("파일 업로드 오류");
			}
		}
		
		questionService.createQuestion(question);
		return "redirect:/";
	}
}
