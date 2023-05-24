package com.dodam.hotel.controller;


import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.InquiryRequestDto;
import com.dodam.hotel.dto.TestDto;
import com.dodam.hotel.dto.UserRequestDto;
import com.dodam.hotel.dto.UserResponseDto;
import com.dodam.hotel.repository.model.Coupon;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.Reply;
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.CouponService;
import com.dodam.hotel.service.GradeService;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.CreateRandomStr;
import com.dodam.hotel.util.Define;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// 메인 페이지 (성희)
	@GetMapping({"","/"})
	public String mainPage() {
		return "/main";
	}
	
	// 로그인 페이지 (현우)
	@GetMapping("/login")
	public String loginPage() {
		return "/user/login";
	}
	
	// 내정보 페이지 (현우)
	@GetMapping("/myPage")
	public String myPage(Model model) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		List<Coupon> coupons = couponService.readByUserId(principal.getId());
		// 등급 정보 불러오기
		GradeInfo responseGrade = gradeService.readGradeByUserId(principal.getId());
		model.addAttribute("responseGrade", responseGrade);
		model.addAttribute("coupons", coupons);
		return "/user/myPage";
	}
	
	// 로그인 기능 구현 (현우)
	@PostMapping("/loginProc")
	public String loginProc(UserRequestDto.LoginFormDto loginDto) {
		UserResponseDto.LoginResponseDto principal = userService.readUserByIdAndPassword(loginDto);
		System.out.println(loginDto);
		System.out.println(principal);
		session.setAttribute(Define.PRINCIPAL, principal);
		
		if(principal.getRandomPwdStatus()) {
			return "/user/changePw";
		}
		
		return "redirect:/myPage";
	}
	
	// 비밀번호 변경 페이지
	@PostMapping("/changePwProc")
	public String changePwProc(UserRequestDto.UpdatePwdDto pwdDto) {
		// 앞에서 비밀번호 확인 처리
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		int resultRow = userService.updateOnlyPw(pwdDto.getChangePwd(), principal.getId());
		if(resultRow != 1) {
			System.out.println("변경 실패");
		}
		return "redirect:/logout";
	}
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/login";
	}
	
	// 회원정보 수정 처리 (김현우)
	@PostMapping("/myPageProc")
	public String myPageProc(UserRequestDto.MyPageFormDto myPageDto) {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		User responseUser = userService.updateUser(myPageDto);
		
		// 비밀번호 수정 시, DB 비밀번호랑 맞는지 확인 (암호화 처리 예정) - 다를경우 바뀐 비밀번호로 세팅
		if (principal.getPassword() != responseUser.getPassword()) {
			principal.setPassword(myPageDto.getPassword());
		}
		
		return "redirect:/myPage";
	}
	
	// 회원가입 페이지 (성희)
	@GetMapping("/join")
	public String joinPage() {
		return "/user/join";
	}
	
	// 회원가입 처리 (성희)
	@PostMapping("/join")
	public String join(UserRequestDto.insertDto insertDto) {
		userService.createUser(insertDto);
		return "redirect:/";
	}
	
	// 멤버쉽 페이지 (성희)
	@GetMapping("/membership")
	public String membershipPage() {
		return "/membership/membership";
	}
	
	// 멤버쉽 가입 처리 (성희)
	@GetMapping("/joinMembership")
	public String membership() {
		UserResponseDto.LoginResponseDto principal = (UserResponseDto.LoginResponseDto)session.getAttribute(Define.PRINCIPAL);
		UserResponseDto.MyPageResponseDto responseUser = userService.readUserByEmail(principal.getEmail());
		userService.createMembership(responseUser.getId());
		return "redirect:/";
	}
	
	// 아이디, 비밀번호 찾기
	@GetMapping("/findIdPw")
	public String findIdPw() {
		return "/user/inquiry";
	}
	
	@PostMapping("/test")
	public String test(TestDto dto) {
		System.out.println(dto.getUsername());
		System.out.println(dto.getPassword());
		System.out.println();
		return "/";
		
	}
	
	public String managerLogin() {
		return "";
	}
	
	// id 찾기 기능
	@PostMapping("/idInquiry")
	public String idInquiry(InquiryRequestDto.IdInquiryRequestDto idInquiryRequestDto, Model model) {
		User responseUser = userService.readUserForIdInquiry(idInquiryRequestDto);
		model.addAttribute("responseUser", responseUser);
		return "/user/idInquiryPage";
	}
	
	// pw 찾기 페이지 이동
	@GetMapping("/pwInquiryPage")
	public String pwInquiryPage() {
		return "/user/pwInquiryPage";
	}
	
	// pw 찾기 기능
	@PostMapping("/pwInquiry")
	public String pwInquiry(InquiryRequestDto.PwInquiryRequestDto pwInquiryRequestDto) {
		// 랜덤 비밀번호 생성
		String randomStr = CreateRandomStr.createRandomString();
		
		pwInquiryRequestDto.setPassword(randomStr);
		
		int resultRow = userService.updatePwByUserInfo(pwInquiryRequestDto);
		
		if(resultRow == 1) {
			String subject = pwInquiryRequestDto.getName() + "님의 임시 비밀번호 입니다.";
	        String content = "<p>로그인 후 비밀번호를 변경해주시길 바랍니다.</p> <br> <h2>임시 비밀번호</h2> <br> <p>" + randomStr + "</p>";
	        String from = Define.ADMIN_EMAIL;
	        String to = pwInquiryRequestDto.getEmail();
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
	            
	            mailHelper.setFrom(from);
	            mailHelper.setTo(to);	
	            mailHelper.setSubject(subject);
	            mailHelper.setText(content, true);
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
		} else {
			// 예외처리 이메일 전송 실패
			System.out.println("이메일 전송 실패");
		}
		return "redirect:/pwInquiryPage";
	}
	
} // end of class
