package com.dodam.hotel.controller;

import com.dodam.hotel.dto.api.ResponseMsg;
import com.dodam.hotel.repository.model.FAQ;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.service.ManagerFAQService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FAQController {
    @Autowired
    private ManagerFAQService managerFAQService;
    @Autowired
    private HttpSession session;
    @GetMapping("/manager/faq")
    public String faqPage(Model model){
        List<FAQ> faqList = managerFAQService.findAllFAQ();
        model.addAttribute("faqList", faqList);
        return "/manager/FAQ";
    }

    @GetMapping("/manager/faq/{id}")
    public String faqDetailPage(@PathVariable Integer id, Model model){
        FAQ faq = managerFAQService.findFAQById(id);
        model.addAttribute("faq", faq);
        return "/manager/FAQDetail";
    }

    @GetMapping("/manager/faq/write")
    public String faqWritePage(){
        return "/manager/FAQWrtie";
    }
    @PostMapping("/manager/faq/write-proc")
    public String faqWriteProc(FAQ faq){
        managerFAQService.createFAQ(faq);
        return "redirect:/manager/FAQ";
    }

    @GetMapping("/manager/faq/update/{id}")
    public String faqUpdatePage(@PathVariable Integer id, Model model){
        FAQ faq = managerFAQService.findFAQById(id);
        model.addAttribute("faq", faq);
        return "/manager/FAQUpdate";
    }

    @PostMapping("/manager/faq/update-proc")
    public String faqUpdateProc(FAQ faq){
        managerFAQService.updateFAQ(faq);
        return "redirect:/manager/FAQ";
    }

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
