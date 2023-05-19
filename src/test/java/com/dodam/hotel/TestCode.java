package com.dodam.hotel;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.util.HashMap;
import java.util.Map;

/**
 * @author lhs-devloper
 */
public class TestCode {

    @Test
    public void mapCheckTest() throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> authenticationMap = new HashMap<>();
//        Map<String, Object> AuthenticationMap = new HashMap<>();
        authenticationMap.put("amount", String.valueOf(1000));

        System.out.println(objectMapper.writeValueAsString(authenticationMap));
    }

    @Test
    public void kakaoMapCheckTest(){
        String GRANT_TYPE = "authorization_code";
        String CLIENT_ID = "20543122589b138f374315f3bbd94eb6";
        String REDIRECT_URI = "http://localhost:8080/auth/kakaoLogin";
        String CLIENT_SECRET = "qdGGE9cr0gs6XB8exvWJWuqyA7k864ZM";
        String APP_ADMIN_KEY = "74e472b2d495ed6df25464561df4bf71";

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Content-Type", "application/x-www-form-urlencoded");

        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        formData.add("grant_type", GRANT_TYPE);
        formData.add("redirect_uri", REDIRECT_URI);
        formData.add("client_id", CLIENT_ID);
//        formData.add("code", code);
        formData.add("client_secret", CLIENT_SECRET);
        System.out.println(formData);

//        httpHeaders.add("Content-type", "application/json; charset=UTF-8");
        HttpEntity<MultiValueMap<String, String>> reqEntity = new HttpEntity<>(formData, httpHeaders);
        System.out.println(reqEntity);

    }
}
