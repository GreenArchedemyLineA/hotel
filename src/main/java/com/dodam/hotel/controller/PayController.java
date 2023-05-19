package com.dodam.hotel.controller;

import com.dodam.hotel.dto.api.nicepay.NicepayDto;
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

import java.util.*;

/**
 * @author lhs-devloper
 */
@Controller
@RequestMapping("/nicepay")
public class PayController {
    private final String CLIENT_ID = "S2_e9b9047ecf2a467b86a6c2311d47b9df";
    private final String SECRET_KEY = "3dd7b2bd320043a69f18b5c3e28d3dd2";

    @GetMapping("/main")
    public String index(Model model){
        model.addAttribute("clientId", CLIENT_ID);
        model.addAttribute("orderId", UUID.randomUUID());
        return "/pay/pay";
    }
    @PostMapping("/payments")
    public String nicePayController(NicepayDto nicepayDto, Model model) throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper objectMapper = new ObjectMapper();
        // header 추가
        System.out.println(nicepayDto);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((CLIENT_ID+":"+SECRET_KEY).getBytes()));
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
            return "/pay/paySuccess";
        }else{
            // 결제 실패 케이스 작성
            System.out.println(responseNode);
            return "/pay/payFailed";
        }
    }
}
