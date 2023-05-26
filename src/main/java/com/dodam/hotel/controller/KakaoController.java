package com.dodam.hotel.controller;

import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserRequestDto.LoginFormDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.dto.UserResponseDto.LoginResponseDto;
import com.dodam.hotel.dto.kakao.KakaoAccount;
import com.dodam.hotel.dto.kakao.KakaoResponseToken;
import com.dodam.hotel.dto.kakao.KakaoUserInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.service.ManagerService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.Define;

// rest api key 335084c1c61f1739470cd6137a97a8e0
// admin api key 74e472b2d495ed6df25464561df4bf71
@Controller
@RequestMapping("/auth")
public class KakaoController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ManagerService managerService;
	
	@Value("${dodam.key}")
	private String dodamKey;
	
	@Autowired
	private HttpSession session;
	
    // /oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code
    @GetMapping({"/", "/index", "/main"})
    public String index(){
        return "/kakao/test";
    }
    
    // 카카오 회원가입 페이지
    @GetMapping("/kakaoJoin")
    public String kakaoJoin() {
    	return "/user/kakaoJoin";
    }
    
    @GetMapping("/kakaoLogin")
    public String kakaoLogin(@RequestParam String code, Model model){
//      String TOKEN_URI = "https://kauth.kakao.com/oauth/token";
      String GRANT_TYPE = "authorization_code";
      String CLIENT_ID = "9b1b097488dc5873535e6b706d20920d";
      String REDIRECT_URI = "http://localhost:8080/auth/kakaoLogin";
      String CLIENT_SECRET = "OjxZYU91ABul5Fbl3GYZxgRf1BAFaUN5";
      String APP_ADMIN_KEY = "5b5a2f726cd2aad3adc4b7a568f3c0d4";

      RestTemplate restTemplate = new RestTemplate();

      URI uri = UriComponentsBuilder
              .fromUriString("https://kauth.kakao.com")
              .path("/oauth/token")
              .encode()
              .build()
              .toUri();


      HttpHeaders httpHeaders = new HttpHeaders();
      httpHeaders.add("Content-Type", "application/x-www-form-urlencoded;charser=utf-8");

      MultiValueMap<String, String> formData = new LinkedMultiValueMap<String, String>();
      formData.add("grant_type", GRANT_TYPE);
      formData.add("redirect_uri", REDIRECT_URI);
      formData.add("client_id", CLIENT_ID);
      formData.add("code", code);
      formData.add("client_secret", CLIENT_SECRET);

//      httpHeaders.add("Content-type", "application/json; charset=UTF-8");
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
//      httpUserInfoHeaders.set("Content-type", "application/json; charset=UTF-8");

      HttpEntity reqUserEntity = new HttpEntity(httpUserInfoHeaders);

      ResponseEntity<KakaoUserInfo> responseUser = restTemplate.exchange(userInfoUri, HttpMethod.GET, reqUserEntity, KakaoUserInfo.class);
      System.out.println(responseUser.getBody().getKakao_account());
      KakaoAccount userInfo = responseUser.getBody().getKakao_account();
      
      
   
     
      List<MUser> users = managerService.managerUserListAll();
      model.addAttribute("user",userInfo);
      
      System.out.println(responseUser.getBody().getKakao_account().getEmail());
      for(MUser user : users) {
    	  
    	  System.out.println(user.getEmail());
    	  if(responseUser.getBody().getKakao_account().getEmail().equals(user.getEmail())) {
    		  // 로그인 처리 
    		  UserRequestDto.LoginFormDto login_user = new LoginFormDto();
    		  login_user.setEmail(responseUser.getBody().getKakao_account().getEmail());
    		  login_user.setPassword(dodamKey);
    		  UserResponseDto.LoginResponseDto principal = userService.readUserByIdAndPassword(login_user);
    		  session.setAttribute(Define.PRINCIPAL, principal);
    		  
    		  return "redirect:/";
    	  }
      }
      
      return "/user/kakaoJoin";
	}	
}
