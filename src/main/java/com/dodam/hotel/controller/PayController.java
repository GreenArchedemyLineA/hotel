package com.dodam.hotel.controller;

import com.dodam.hotel.dto.api.kakaopay.KakaoPay;
import com.dodam.hotel.dto.api.nicepay.NicepayDto;
import com.dodam.hotel.dto.api.kakaopay.KakaoPaymentDto;
import com.dodam.hotel.dto.api.kakaopay.KakaoSinglePayment;
import com.dodam.hotel.dto.api.tosspay.TossPaymentRequestDto;
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
    private final String NICE_PAY_CLIENT_ID = "S2_e9b9047ecf2a467b86a6c2311d47b9df";
    private final String NICE_PAY_SECRET_KEY = "3dd7b2bd320043a69f18b5c3e28d3dd2";
    private final RestTemplate restTemplate = new RestTemplate();
    private String kakaoTid;
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

        ObjectMapper objectMapper = new ObjectMapper();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((NICE_PAY_CLIENT_ID+":"+NICE_PAY_SECRET_KEY).getBytes()));
        headers.setContentType(MediaType.APPLICATION_JSON);


        Map<String, Object> AuthenticationMap = new HashMap<>();
        AuthenticationMap.put("amount", String.valueOf(nicepayDto.getAmount()));

        HttpEntity<String> request = new HttpEntity<>(objectMapper.writeValueAsString(AuthenticationMap), headers);


        // Jackson JsonNode
        ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(
                "https://sandbox-api.nicepay.co.kr/v1/payments/" + nicepayDto.getTid(),
                HttpMethod.POST,
                request,
                JsonNode.class
        );

        JsonNode responseNode = responseEntity.getBody();
        String resultCode = responseNode.get("resultCode").asText();
        if(resultCode.equalsIgnoreCase("0000")){
            // 결제 성공 케이스 작성하고
            System.out.println(responseNode);
            return "/nicepay/paySuccess";
        }else{
            // 결제 실패 케이스 작성
            System.out.println(responseNode);
            return "/nicepay/payFailed";
        }
    }
    // 카카오 결제(SDK 지원 방식이 보이지 않아 다음과 같이 사용)
    @GetMapping("/kakaopay")
    public String kakaopayController(){
        KakaoPaymentDto kakaoPaymentDto = (KakaoPaymentDto) kakaoPay.payReady();
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
    public String tossSuccessController(String paymentKey, String orderId, String amount, String paymentType){
        System.out.println(paymentKey);
        System.out.println(orderId);
        System.out.println(amount);
        System.out.println(paymentType);

        return "redirect:/pay/success";
    }
}
