package com.dodam.hotel.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dodam.hotel.dto.QuestionRequestDto.InsertQuestionRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.FAQ;
import com.dodam.hotel.repository.model.TestQuestion;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.util.Define;

/**
 * 
 * @author 현우
 * faq, 문의 controller
 *
 */
@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private HttpSession session;
	
	// faq로 이동
	@GetMapping("/question")
	public String questionPage(Model model) {
		List<FAQ> faqList = questionService.readAllFaq();
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
	//문의사항 게시판
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
	//문의 사항 상세보기
	@GetMapping("/questionDetail/{id}")
	public String questionDetail(@PathVariable Integer id,Model model) {
		TestQuestion question = questionService.findById(id);
		if(question != null) {
			model.addAttribute("question",question);
		}
		return "/board/questionDetail";
	}
	//댓글 달아 보내기
	@PostMapping("/reply/{questionId}/{managerId}")
	@Transactional
	public String insertReply(String content,@PathVariable Integer questionId,@PathVariable Integer managerId) {
		int questionStatus = questionService.updateStatusById(questionId);
		int insertReply = questionService.insertReply(content, questionId, managerId);
		return "redirect:/question/questionList";
	}
	//질문 삭제
	@GetMapping("/questionDelete/{questionId}")
	public String questionDelete(@PathVariable Integer questionId){
		int deleteQuestion = questionService.questionDeleteById(questionId);
		return "redirect:/question/questionList";
	}
	
	@GetMapping("/category")
	public String questionCategory(String category,Model model) {
		List<TestQuestion> questionList = questionService.findByCategory(category);
		if(questionList != null) {
			model.addAttribute("questionList",questionList);
		}
		return "/board/question";
	}
	
	
}
