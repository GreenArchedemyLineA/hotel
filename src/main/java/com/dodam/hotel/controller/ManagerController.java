package com.dodam.hotel.controller;

import javax.servlet.http.HttpSession;

import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.dto.UserListDto;
import com.dodam.hotel.repository.model.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.dodam.hotel.dto.InsertDto;
import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.repository.interfaces.ManagerRepository;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.service.ManagerService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private HttpSession session;

	@Autowired
	private ManagerRepository managerRepository;

	@GetMapping("/managerPage")
	public String managerPage() {

		return "/manager/managerLogin";
	}
	
	// 이름으로 유저 조회;
	@GetMapping("/userList")
	public String mUserList(String name,Model model){
		
		List<MUser> userList = managerService.managerUserList(name);
		System.out.println(userList);
		if(userList != null) {
			model.addAttribute("userList",userList);
		}
		return "/manager/userList";
	}
	@GetMapping("/blackList")
	public String mUserList(Model model,int blackList){
		List<MUser> userBlackList = managerService.managerUserBlackList(blackList);
		System.out.println(userBlackList);
		if(userBlackList != null) {
			model.addAttribute("userList",userBlackList);
		}
		return "/manager/userList";
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
		return "redirect:/manager/userList";
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
		model.addAttribute("userDetail",userGradeDetail);
		System.out.println(userGradeDetail.getGrade());
		System.out.println(userGradeDetail.getMuser());
		return "/manager/userDetail";
	}
	//등급 수정 버튼
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


}
