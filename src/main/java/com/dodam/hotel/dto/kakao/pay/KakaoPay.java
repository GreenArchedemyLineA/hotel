package com.dodam.hotel.dto.kakao.pay;

import com.dodam.hotel.interfaces.PayRequest;
import com.dodam.hotel.interfaces.SinglePaymentService;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
/**
 * @author lhs-devloper
 */
public class KakaoPay implements SinglePaymentService {
    private PayRequest payRequest;
    private final RestTemplate restTemplate = new RestTemplate();
    private final String APP_ADMIN_KEY = "74e472b2d495ed6df25464561df4bf71";
    @Override
    public boolean payService() {
        URI uri = UriComponentsBuilder
                .fromUriString("https://kapi.kakao.com")
                .path("/oauth/token")
                .encode()
                .build()
                .toUri();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + APP_ADMIN_KEY);
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);


//        HttpEntity<String>
//
//        ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(
//                uri,
//                HttpMethod.POST,
//
//        );

        return false;
    }

    public void setPayRequest(PayRequest payDto) {
        this.payRequest = payDto;
    }
}
