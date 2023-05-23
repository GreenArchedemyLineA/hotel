package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;


import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.page.Criteria;
import com.dodam.hotel.repository.model.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.service.ManagerService;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	@Autowired
	private HttpSession session;


	@GetMapping("/managerPage")
	public String managerPage() {

		return "/manager/managerLogin";
	}
	
	@GetMapping("/managerMain")
	public String managerMain() {

		return "/manager/managerMain";
	}
	
	@GetMapping("/managerLogout")
	public String managerLogout(){
		session.invalidate();
		return "redirect:/manager/managerPage";
	}
	
	//유저 리스트
	@GetMapping("/userList")
	public String mUserListAll(@ModelAttribute("params") Criteria criteria ,Model model){
		
		List<MUser> userList = managerService.managerUserListAll(criteria);
		System.out.println(userList);
		if(userList != null) {
			model.addAttribute("userList",userList);
		}
		return "/manager/userList";
	}
	// 이름으로 유저 조회;
	@GetMapping("/userNameList")
	public String mUserList(String name,Model model){
		
		List<MUser> userList = managerService.managerUserList(name);
		System.out.println(userList);
		if(userList != null) {
			model.addAttribute("userList",userList);
		}
		return "/manager/userList";
	}

	//블랙리스트 조회
	@GetMapping("/blackList")
	public String mUserBlackList(Model model){
		List<MUser> userBlackList = managerService.managerUserBlackList();
		System.out.println(userBlackList);
		if(userBlackList != null) {
			model.addAttribute("userList",userBlackList);
		}
		return "/manager/userBlackList";
	}
	
	//블랙리스트 탈퇴처리
	@GetMapping("/userWithdrawal/{id}/{email}")
	@Transactional
	public String userWithdrawal(@PathVariable Integer id,@PathVariable String email) {
		
		int userWithdrawal = managerService.userUpdateWithdrawal(id);
		int userOriginEmail = managerService.userUpdateOriginEmail(email, id);
		//현우 쪽이랑 합친뒤 유틸 패키지에 있는 랜덤 문자 매서드 를 불러와서 이메일 뒤에 합쳐준다
		int WithdrawalEmail = managerService.withdrawalEmail(email+"/", id);
		System.out.println(id);
		System.out.println(email);
		return "redirect:/manager/blackList";
	}
	
	//매니저 로그인
	@PostMapping("/managerSignInProc")
	public String managersign(ManagerSignInFormDto managerSignInFormDto) {

		Manager principal = managerService.managerSign(managerSignInFormDto);
		System.out.println(managerSignInFormDto.getUsername());
		System.out.println(managerSignInFormDto.getPassword());
		System.out.println(principal);
		if (principal != null) {
			session.setAttribute("principal", principal);
		}
		return "/manager/managerMain";
	}

	@GetMapping("/roomStatus")
	public String Check(StatusParams statusParams, Model model) {
		List<Room> rooms;
		System.out.println(statusParams);
		// 전체 조회
		if (statusParams.getRoomStatus() == null
				&& statusParams.getPrice() == null
				&& statusParams.getNumberOfp() == null) {
			rooms = managerService.findAllRoomList();
		}
		// 선택 조회(?? 변경 필요)
		else {
			rooms = managerService.findConditionsRoomList(statusParams);
		}

		model.addAttribute("roomList", rooms);
		return "/manager/status";
	}

	@GetMapping("/roomStatusDetail")
	public String RoomStatusDetail(Integer roomId, Model model) {
		Room room = managerService.findByRoom(roomId);

		model.addAttribute("room", room);
		return "/manager/roomDetailStatus";
	}
	
	//회원 정보 상세 조회 or 
	@GetMapping("/userDetail/{id}")
	public String userDetail(@PathVariable Integer id,Model model) {
		GradeInfo userGradeDetail = managerService.selectUserGrade(id);
		System.out.println(userGradeDetail);
		if(userGradeDetail != null) {
			model.addAttribute("userDetail",userGradeDetail);
		}
		return "/manager/userDetail";
	}
	//블랙 리스트 지정
	@GetMapping("/updateBlack/{id}")
	public String updateBlackList(@PathVariable Integer id) {
		int blackList = managerService.updateBlackList(id);
		return "redirect:/manager/userDetail/{id}";
	}
	
	//블랙 리스트 해제
	@GetMapping("/updateWhite/{id}")
	public String updateWhiteList(@PathVariable Integer id) {
		int blackList = managerService.updateWhiteList(id);
		return "redirect:/manager/userDetail/{id}";
	}
	//등급 수정 
	@PostMapping("/updateGrade/{id}")
	public String updateGradeProc(@PathVariable Integer id ,Integer gradeId) {
		
		// 서비스
		// 유저 회원변경 서비스 => updateUserGrade
		
		// GetMapping(Controller) getUser
		// 특정유저에대해서 찾는거(서비스) => findUser
		// 저장소 => findUserById()
		managerService.changeGradeByUserIdAndGradeId(gradeId, id);
		return "redirect:/manager/userDetail/" + id;
	}
	@GetMapping("/deleteBlackList")
	public String deleteBlackList() {
		
		return "redirect:/manager/";
	}

}
