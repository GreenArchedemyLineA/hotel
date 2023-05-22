package com.dodam.hotel.controller;

import com.dodam.hotel.dto.kakao.KakaoResponseToken;
import com.dodam.hotel.dto.kakao.KakaoUserInfo;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

// rest api key 335084c1c61f1739470cd6137a97a8e0
// admin api key 74e472b2d495ed6df25464561df4bf71
@Controller
@RequestMapping("/auth")
public class KakaoController {
    // /oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code
    @GetMapping({"/", "/index", "/main"})
    public String index(){
        return "/kakao/test";
    }

    @GetMapping("/kakaoLogin")
    public String kakaoLogin(String code){

//        String TOKEN_URI = "https://kauth.kakao.com/oauth/token";
        String GRANT_TYPE = "authorization_code";
        String CLIENT_ID = "20543122589b138f374315f3bbd94eb6";
        String REDIRECT_URI = "http://localhost:8080/auth/kakaoLogin";
        String CLIENT_SECRET = "qdGGE9cr0gs6XB8exvWJWuqyA7k864ZM";
        String APP_ADMIN_KEY = "74e472b2d495ed6df25464561df4bf71";

        RestTemplate restTemplate = new RestTemplate();

        URI uri = UriComponentsBuilder
                .fromUriString("https://kauth.kakao.com")
                .path("/oauth/token")
                .encode()
                .build()
                .toUri();


        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Content-Type", "application/x-www-form-urlencoded");

        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        formData.add("grant_type", GRANT_TYPE);
        formData.add("redirect_uri", REDIRECT_URI);
        formData.add("client_id", CLIENT_ID);
        formData.add("code", code);
        formData.add("client_secret", CLIENT_SECRET);

//        httpHeaders.add("Content-type", "application/json; charset=UTF-8");
        HttpEntity<MultiValueMap<String, String>> reqEntity = new HttpEntity<>(formData, httpHeaders);

        ResponseEntity<KakaoResponseToken> response = restTemplate.exchange(uri, HttpMethod.POST, reqEntity, KakaoResponseToken.class);

        System.out.println("token:" + response.getBody());
        // AccessToken
        String accessToken = response.getBody().getAccess_token();
        System.out.println(accessToken);
        URI userInfoUri = UriComponentsBuilder
                .fromUriString("https://kapi.kakao.com")
                .path("/v2/user/me")
                .encode()
                .build()
                .toUri();


        HttpHeaders httpUserInfoHeaders = new HttpHeaders();
        httpUserInfoHeaders.set("Authorization", "Bearer " + accessToken);
//        httpUserInfoHeaders.set("Content-type", "application/json; charset=UTF-8");

        HttpEntity reqUserEntity = new HttpEntity(httpUserInfoHeaders);

        ResponseEntity<KakaoUserInfo> responseUser = restTemplate.exchange(userInfoUri, HttpMethod.GET, reqUserEntity, KakaoUserInfo.class);
        System.out.println(responseUser.getBody().getKakao_account());
        return null;
    }
}