package com.dodam.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.repository.model.MembershipInfo;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.RoomType;
import com.dodam.hotel.service.ManagerService;
import com.dodam.hotel.service.RoomService;
import com.dodam.hotel.util.PagingObj;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	@Autowired
	private HttpSession session;
	@Autowired
	private RoomService roomService;

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
	public String mUserListAll(Model model){
		
		List<MUser> userList = managerService.managerUserListAll();
		if(userList != null) {
			model.addAttribute("userList",userList);
		}
		return "/manager/userList";
	}
	
	// 이름으로 유저 조회;
	@GetMapping("/userNameList")
	public String mUserList(String name,Model model){
		
		List<MUser> userList = managerService.managerUserList(name);
		if(userList != null) {
			model.addAttribute("userList",userList);
		}
		return "/manager/userList";
	}
	
	//등급으로 유저 조회
	@GetMapping("/userGradeList")
	public String mUserGradeList(Integer gradeId,Model model) {
		List<GradeInfo> userGradeList = managerService.managerUserGradeList(gradeId);
		if(userGradeList != null) {
			model.addAttribute("userList",userGradeList);
		}
		return "/manager/userGrade";
	}
	
	//맴버쉽 회원 조회
	@GetMapping("/membershipUserList")
	public String membershipUserList(Model model) {
		List<MembershipInfo> membershipUserList = managerService.findByMembershipUserList();
		if(membershipUserList != null) {
			model.addAttribute("userList",membershipUserList);
		}
		return "/manager/membershipUserList";
	}
	
	//블랙리스트 조회
	@GetMapping("/blackList")
	public String mUserBlackList(Model model){
		List<MUser> userBlackList = managerService.managerUserBlackList();
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
		return "redirect:/manager/blackList";
	}
	
	//매니저 로그인
	@PostMapping("/managerSignInProc")
	public String managersign(ManagerSignInFormDto managerSignInFormDto) {

		Manager principal = managerService.managerSign(managerSignInFormDto);
		if (principal != null) {
			session.setAttribute("principal", principal);
		}
		return "/manager/managerMain";
	}

	
	@GetMapping("/roomStatus")
	public String Check(StatusParams statusParams, Model model, 
			@RequestParam(name = "nowPage", defaultValue = "1" , required = false) String nowPage, 
			@RequestParam(name = "cntPerPage", defaultValue = "5" , required = false) String cntPerPage) {
		List<Room> rooms;
		// 전체 조회
		int total = managerService.readAllRoomListCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		if (statusParams.getRoomStatus() == null
				&& statusParams.getPrice() == null
				&& statusParams.getNumberOfP() == null) {
			rooms = managerService.findAllRoomList(obj);
		}
		// 선택 조회(?? 변경 필요)
		else {
			// 페이징처리 안했음
			rooms = managerService.findConditionsRoomList(statusParams);
		}
		
		model.addAttribute("paging", obj);
		model.addAttribute("roomList", rooms);
		return "/manager/status";
	}
	
	//객실 정보 상세 조회
	@GetMapping("/roomStatusDetail")
	public String RoomStatusDetail(Integer roomId, Model model) {
		Room room = managerService.findByRoom(roomId);
		model.addAttribute("room", room);
		return "/manager/roomDetailStatus";
	}
	
	// 객실 사용가능 상태값 변경
	@PostMapping("/roomStatus/{id}")
	public String roomStatus(@PathVariable Integer id,Boolean availability) {
		int roomStatus = roomService.RoomStatusTrueAndFalse(id,availability);
		return "redirect:/manager/roomStatus";
	}
	
	//회원 정보 상세 조회 or 
	@GetMapping("/userDetail/{id}")
	public String userDetail(@PathVariable Integer id,Model model) {
		GradeInfo userGradeDetail = managerService.selectUserGrade(id);
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
		managerService.changeGradeByUserIdAndGradeId(gradeId, id);
		return "redirect:/manager/userDetail/" + id;
	}
	
	@GetMapping("/deleteBlackList")
	public String deleteBlackList() {
		return "redirect:/manager/";
	}

}
