package com.dodam.hotel.controller;

import com.dodam.hotel.dto.api.kakaopay.KakaoPay;
import com.dodam.hotel.dto.api.kakaopay.KakaoRequestDto;
import com.dodam.hotel.dto.api.nicepay.NicePay;
import com.dodam.hotel.dto.api.nicepay.NicepayDto;
import com.dodam.hotel.dto.api.kakaopay.KakaoPaymentDto;
import com.dodam.hotel.dto.api.kakaopay.KakaoSinglePayment;
import com.dodam.hotel.dto.api.nicepay.NicepayResultDto;
import com.dodam.hotel.dto.api.tosspay.TossPay;
import com.dodam.hotel.dto.api.tosspay.TossResponse;
import com.dodam.hotel.dto.api.tosspay.TosspayRequest;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.*;

/**
 * @author lhs-devloper
 */
@Controller
@RequestMapping("/pay")
public class PayController {
    private KakaoPay kakaoPay = new KakaoPay();
    private NicePay nicePay = new NicePay();
    private TossPay tossPay = new TossPay();
    private final String NICE_PAY_CLIENT_ID = "S2_e9b9047ecf2a467b86a6c2311d47b9df";
    private final String NICE_PAY_SECRET_KEY = "3dd7b2bd320043a69f18b5c3e28d3dd2";
    private final RestTemplate restTemplate = new RestTemplate();
    private String kakaoTid;

    // 다음은 카카오, 토스, 나이스페이 결제 예제를 위한 페이지입니다
    @GetMapping("/main")
    public String index(Model model){
        model.addAttribute("clientId", NICE_PAY_CLIENT_ID);
        model.addAttribute("orderId", UUID.randomUUID());
        return "/pay/pay";
    }

    @GetMapping("/success")
    public String successController(){
        return "/pay/paySuccess";
    }

    // nicepay 결제 성공
    @PostMapping("/payments")
    public String nicePayController(NicepayDto nicepayDto, Model model) throws JsonProcessingException {
        NicepayResultDto nicepayResultDto = (NicepayResultDto) nicePay.payReady(nicepayDto);
        if("0000".equals(nicepayResultDto.getResultCode())){
            // 결제 성공 케이스 작성하고
            System.out.println(nicepayResultDto);
            return "redirect:/pay/success";
        }else{
            // 결제 실패 케이스 작성
            System.out.println(nicepayResultDto);
            return "redirect:/pay/fail";
        }
    }
    // 카카오 결제(SDK 지원 방식이 보이지 않아 다음과 같이 사용)
    @GetMapping("/kakaopay")
    public String kakaopayController(KakaoRequestDto kakaoRequestDto){
        if(kakaoRequestDto.getItem_name() == null || kakaoRequestDto.getTotal_amount() == null){
            //인터셉터 처리
        }
        KakaoPaymentDto kakaoPaymentDto = (KakaoPaymentDto) kakaoPay.payReady(kakaoRequestDto);
        return "redirect:" +kakaoPaymentDto.getNext_redirect_pc_url();
    }

    @GetMapping("/kakao/success")
    public String kakaoPaySuccessControler(String pg_token){
        System.out.println("pgToken: " + pg_token);
        KakaoSinglePayment kakaoSinglePayment = (KakaoSinglePayment) kakaoPay.payApprove(pg_token);
        return "redirect:/pay/success";
    }

    // 토스결제 성공 시
    @GetMapping("/toss/success")
    public String tossSuccessController(TosspayRequest tosspayRequest){
        System.out.println(tosspayRequest);
        TossResponse tossResponse = (TossResponse) tossPay.payReady(tosspayRequest);
        return "redirect:/pay/success";
    }
}
// 다이닝 예약
// 객실예약 마무리

// 멤버쉽만 패키지 예약가능
// -> 패키지따로 예약 페이지를 만드는게 훨씬나음..(?)
// 리팩토링(중요동 낮음)