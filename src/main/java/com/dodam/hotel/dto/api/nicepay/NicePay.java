package com.dodam.hotel.dto.api.nicepay;

import com.dodam.hotel.dto.api.pay.PayApproveRequest;
import com.dodam.hotel.dto.api.pay.PayInterface;
import com.dodam.hotel.dto.api.pay.PayReadyInterface;
import com.dodam.hotel.dto.api.pay.PayReadyResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class NicePay implements PayInterface {
    private RestTemplate restTemplate = new RestTemplate();
    private ObjectMapper objectMapper = new ObjectMapper();

    private final String NICE_PAY_CLIENT_ID = "S2_e9b9047ecf2a467b86a6c2311d47b9df";
    private final String NICE_PAY_SECRET_KEY = "3dd7b2bd320043a69f18b5c3e28d3dd2";
    @Override
    public PayReadyResponse payReady() {
        return null;
    }

    @Override
    public PayReadyResponse payReady(PayReadyInterface payReadyInterface){
        NicepayDto nicepayDto = (NicepayDto) payReadyInterface;

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((NICE_PAY_CLIENT_ID+":"+NICE_PAY_SECRET_KEY).getBytes()));
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, Object> AuthenticationMap = new HashMap<>();
        AuthenticationMap.put("amount", String.valueOf(nicepayDto.getAmount()));


        HttpEntity<String> request = null;
        try {
            request = new HttpEntity<>(objectMapper.writeValueAsString(AuthenticationMap), headers);
            // Jackson JsonNode
            ResponseEntity<NicepayResultDto> responseEntity = restTemplate.exchange(
                    "https://sandbox-api.nicepay.co.kr/v1/payments/" + nicepayDto.getTid(),
                    HttpMethod.POST,
                    request,
                    NicepayResultDto.class
            );
            NicepayResultDto responseNode = responseEntity.getBody();
            return responseNode;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public PayApproveRequest payApprove(String pgToken) {
        return null;
    }
    
    public  ResponseEntity<NicepayResultDto> requestCancel(String tid,String amount){

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + Base64.getEncoder().encodeToString((NICE_PAY_CLIENT_ID + ":" + NICE_PAY_SECRET_KEY).getBytes()));
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, Object> AuthenticationMap = new HashMap<>();
        AuthenticationMap.put("amount", amount);
        AuthenticationMap.put("reason", "test");
        AuthenticationMap.put("orderId", UUID.randomUUID().toString());

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(AuthenticationMap, headers);

        ResponseEntity<NicepayResultDto> responseEntity = restTemplate.postForEntity(
            "https://sandbox-api.nicepay.co.kr/v1/payments/"+ tid +"/cancel", request, NicepayResultDto.class);

        return responseEntity;
    }
}
