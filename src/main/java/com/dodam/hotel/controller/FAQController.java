package com.dodam.hotel.controller;

import com.dodam.hotel.dto.api.ResponseMsg;
import com.dodam.hotel.handler.exception.ManagerCustomRestFullException;
import com.dodam.hotel.repository.interfaces.FAQRepository;
import com.dodam.hotel.repository.interfaces.PackageRepository;
import com.dodam.hotel.repository.model.FAQ;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.service.ManagerFAQService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FAQController {
    @Autowired
    private ManagerFAQService managerFAQService;
    @Autowired
    private PackageRepository packageRepository;
    @Autowired
    private HttpSession session;
    
    //매니저용 
    @GetMapping("/manager/faq")
    public String faqPage(Model model){
        List<FAQ> faqList = managerFAQService.findAllFAQ();
        model.addAttribute("faqList", faqList);
        return "/manager/FAQ";
    }

    //매니저용 
    @GetMapping("/manager/faq/{id}")
    public String faqDetailPage(@PathVariable Integer id, Model model){
        FAQ faq = managerFAQService.findFAQById(id);
        model.addAttribute("faq", faq);
        return "/manager/FAQDetail";
    }

    //매니저용 
    @GetMapping("/manager/faq/write")
    public String faqWritePage(){
        return "/manager/FAQWrtie";
    }
    
    //매니저용 
    @PostMapping("/manager/faq/write-proc")
    public String faqWriteProc(@Validated FAQ faq, BindingResult bindingResult){
    	if(bindingResult.hasErrors()) {
    		bindingResult.getAllErrors().forEach(e -> {
    			throw new ManagerCustomRestFullException(e.getDefaultMessage(), HttpStatus.BAD_REQUEST);
    		});
    	}
        managerFAQService.createFAQ(faq);
        return "redirect:/manager/FAQ";
    }

    //매니저용 
    @GetMapping("/manager/faq/update/{id}")
    public String faqUpdatePage(@PathVariable Integer id, Model model){
        FAQ faq = managerFAQService.findFAQById(id);
        model.addAttribute("faq", faq);
        return "/manager/FAQUpdate";
    }

    //매니저용 
    @PostMapping("/manager/faq/update-proc")
    public String faqUpdateProc(@Validated FAQ faq, BindingResult bindingResult){
    	if(bindingResult.hasErrors()) {
    		bindingResult.getAllErrors().forEach(e -> {
    			throw new ManagerCustomRestFullException(e.getDefaultMessage(), HttpStatus.BAD_REQUEST);
    		});
    	}
        managerFAQService.updateFAQ(faq);
        return "redirect:/manager/faq";
    }

    //매니저용 
    @DeleteMapping("/manager/delete/faq")
    @ResponseBody
    public ResponseMsg faqDeleteProc(Integer id){
        Manager manager = (Manager) session.getAttribute("manager");
        /*
        // 성공케이스
        {
            success: 200,
            redirect_uri = "/manager/FAQ"
        }
        // 실패 케이스
        {
            success: 400,

        }
         */
        if(manager == null){

            ResponseMsg failMsg = ResponseMsg
                    .builder()
                    .status_code(HttpStatus.FORBIDDEN.value())
                    .msg("사용 인증 권한이 없습니다")
                    .redirect_uri("/manager/faq/"+id)
                    .build();
            return failMsg;
        }
        managerFAQService.deleteFAQ(id);

        ResponseMsg successMsg = ResponseMsg
                .builder()
                .status_code(HttpStatus.OK.value())
                .msg("삭제완료되었습니다")
                .redirect_uri("/manager/faq")
                .build();

        return successMsg;
    }
}
