package com.dodam.hotel.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.util.Define;

/**
 * 
 * @author 성희
 * 자주묻는 질문 controller
 *
 */
@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/question")
	public String questionPage( ) {
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
