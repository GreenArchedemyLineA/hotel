package com.dodam.hotel.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.dodam.hotel.repository.model.Reservation;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.User;
import com.dodam.hotel.service.DiningService;
import com.dodam.hotel.service.EventService;
import com.dodam.hotel.service.FacilitiesService;
import com.dodam.hotel.service.ManagerReservationService;
import com.dodam.hotel.service.ManagerService;
import com.dodam.hotel.service.QuestionService;
import com.dodam.hotel.service.ReservationService;
import com.dodam.hotel.service.RoomService;
import com.dodam.hotel.service.UserService;
import com.dodam.hotel.util.PagingObj;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	private ManagerService managerService;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	@Autowired
	private RoomService roomService;
	@Autowired
	private EventService eventService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private DiningService diningService;
	@Autowired
	private FacilitiesService facilitiesService;
	@Autowired
	private ManagerReservationService managerReservationService;
	@Autowired
	private ReservationService reservationService;

	@GetMapping("/managerPage")
	public String managerPage() {

		return "/manager/managerLogin";
	}
	
    @GetMapping("/payCancel")
    public String payCancel() {
    	return "/user/payCancel";
    }
	
	@GetMapping("/managerMain")
	public String managerMain(Model model) {
		model.addAttribute("viewAll", eventService.findByIdLimit());
		model.addAttribute("question", questionService.readQuestionCountByStatus0());
		model.addAttribute("availableRoom", roomService.readRoomAvailableCount());
		model.addAttribute("notAvailableRoom", roomService.readRoomNotAvailableCount());
		model.addAttribute("restaurant", diningService.readRestaurantStatus());
		model.addAttribute("bar", diningService.readBarStatus());
		model.addAttribute("pool", facilitiesService.readPoolStatus());
		model.addAttribute("spa", facilitiesService.readSpaStatus());
		model.addAttribute("fitness", facilitiesService.readFitnessStatus());

		List<User> userToday = userService.readJoinUserToday();
		int userTodayCount = userToday.size();
		List<MembershipInfo> membershipToday = userService.readJoinMembershipToday();
		int membershipTodayCount = membershipToday.size();
		if (userToday != null) {
			model.addAttribute("userTodayCount", userTodayCount);
		}
		if (membershipToday != null) {
			model.addAttribute("membershipTodayCount", membershipTodayCount);
		}

		int totalPrice = managerReservationService.readBeforeTodayTotalPrice();
		List<Integer> price = new ArrayList<>();
		for (int i = 1; i < 7; i++) {
			Integer beforetotalPrice = managerReservationService.readBeforeTotalPrice(i);
			if (beforetotalPrice == null) {
				beforetotalPrice = 0;
			}
			price.add(beforetotalPrice);
			System.out.println(beforetotalPrice);
		}
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("price", price);

		return "/manager/managerMain";
	}

	@GetMapping("/managerLogout")
	public String managerLogout() {
		session.invalidate();
		return "redirect:/manager/managerPage";
	}

	// 유저 리스트
	@GetMapping("/userList")
	public String mUserListAll(Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required = false)String cntPerPage){
		List<MUser> userList = managerService.managerUserListAll();
		List<User> userToday = userService.readJoinUserToday();
		int userTodayCount = userToday.size();
		List<MembershipInfo> membershipToday = userService.readJoinMembershipToday();
		int membershipTodayCount = membershipToday.size();
		if (userList != null) {
			model.addAttribute("userList", userList);
		}
		if (userToday != null) {
			model.addAttribute("userTodayCount", userTodayCount);
		}
		if (membershipToday != null) {
			model.addAttribute("membershipTodayCount", membershipTodayCount);
		}
		int total = managerService.findByAllCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll",managerService.managerUserListAllPaging(obj));
		return "/manager/userList";
	}

	// 이름으로 유저 조회;
	@GetMapping("/userNameList")
	public String mUserList(String name,Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required = false)String cntPerPage){
		int total = managerService.findByNameCount(name);
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<MUser> userList = managerService.managerUserList(obj,name);
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", userList);
		return "/manager/userList";
	}

	// 등급으로 유저 조회
	@GetMapping("/userGradeList")

	public String mUserGradeList(Integer gradeId, Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required = false)String cntPerPage) {
		int total = managerService.findByGradeAllCount(gradeId);
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<GradeInfo> userGradeList = managerService.managerUserGradeList(obj, gradeId);
		if (userGradeList != null) {
			model.addAttribute("userList", userGradeList);
		}
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", userGradeList);
		return "/manager/userGrade";
	}
	
	// 회원 정보 상세 조회 or
	@GetMapping("/userDetail/{id}")
	public String userDetail(@PathVariable Integer id, Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required = false)String cntPerPage) {
		int total = reservationService.readAllReservationByUserIdCount(id);
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Reservation> reservations = reservationService.readAllResrevationByUserIdPaging(obj, id);
		GradeInfo userGradeDetail = managerService.selectUserGrade(id);
		if (userGradeDetail != null) {
			model.addAttribute("userDetail", userGradeDetail);
			model.addAttribute("paging", obj);
			model.addAttribute("reservations", reservations);
		}
		return "/manager/userDetail";
	}
	
	// 맴버쉽 회원 조회
	@GetMapping("/membershipUserList")
	public String membershipUserList(Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required = false)String cntPerPage) {
		int total = managerService.findByMembershipAllCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<MembershipInfo> membershipUserList = managerService.findByMembershipUserList(obj);
		if (membershipUserList != null) {
			model.addAttribute("userList", membershipUserList);
		}
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", membershipUserList);
		return "/manager/membershipUserList";
	}

	// 블랙리스트 조회
	@GetMapping("/blackList")
	public String mUserBlackList(Model model
			,@RequestParam(name ="nowPage", defaultValue = "1", required = false)String nowPage
			,@RequestParam(name ="cntPerPage", defaultValue = "5", required = false)String cntPerPage){
		int total = managerService.findByBlackListCount();
		PagingObj obj = new PagingObj(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<MUser> userBlackList =  managerService.managerUserBlackList(obj);
		if (userBlackList != null) {
			model.addAttribute("userList", userBlackList);
		}
		model.addAttribute("paging", obj);
		model.addAttribute("viewAll", userBlackList);
		return "/manager/userBlackList";
	}

	// 매니저 로그인
	@PostMapping("/managerSignInProc")
	public String managersign(ManagerSignInFormDto managerSignInFormDto) {

		Manager principal = managerService.managerSign(managerSignInFormDto);
		if (principal != null) {
			session.setAttribute("principal", principal);
		}
		return "redirect:/manager/managerMain";
	}

	/*
	 * @GetMapping("/roomStatus") public String Check(StatusParams statusParams,
	 * Model model,
	 * 
	 * @RequestParam(name = "nowPage", defaultValue = "1" , required = false) String
	 * nowPage,
	 * 
	 * @RequestParam(name = "cntPerPage", defaultValue = "5" , required = false)
	 * String cntPerPage) { List<Room> rooms; // 전체 조회 int total =
	 * managerService.readAllRoomListCount(); PagingObj obj = new PagingObj(total,
	 * Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); if
	 * (statusParams.getRoomStatus() == null && statusParams.getPrice() == null &&
	 * statusParams.getNumberOfP() == null) { rooms =
	 * managerService.findAllRoomList(obj); } // 선택 조회(?? 변경 필요) else { // 페이징처리 안했음
	 * rooms = managerService.findConditionsRoomList(statusParams); }
	 * 
	 * model.addAttribute("paging", obj); model.addAttribute("roomList", rooms);
	 * return "/manager/status"; }
	 */

	@GetMapping("/roomStatus")
	public String Check(StatusParams statusParams, Integer roomId, Model model) {
		List<Room> rooms;
		Room room = managerService.findByRoom(roomId);
		model.addAttribute("room", room);
		// 전체 조회
		int total = managerService.readAllRoomListCount();
		if (statusParams.getRoomStatus() == null && statusParams.getPrice() == null
				&& statusParams.getNumberOfP() == null) {
			rooms = managerService.findAllRoomList();
		}
		// 선택 조회(?? 변경 필요)
		else {
			// 페이징처리 안했음
			rooms = managerService.findConditionsRoomList(statusParams);
		}
		model.addAttribute("roomList", rooms);
		for (int i = 0; i < 16; i++) {
			System.out.println(managerReservationService.findTodayAllReservation());
		}
		model.addAttribute("reservation", managerReservationService.findTodayAllReservation());
		return "/manager/status";
	}

	// 객실 정보 상세 조회
	@GetMapping("/roomStatusDetail")
	public String RoomStatusDetail(Integer roomId, Model model) {
		Room room = managerService.findByRoom(roomId);
		model.addAttribute("room", room);
		return "/manager/roomDetailStatus";
	}

	// 객실 사용가능 상태값 변경
	@PostMapping("/roomStatus/{id}")
	public String roomStatus(@PathVariable Integer id, Boolean availability) {
		int roomStatus = roomService.RoomStatusTrueAndFalse(id, availability);
		return "redirect:/manager/roomStatus";
	}



	// 블랙 리스트 지정
	@GetMapping("/updateBlack/{id}")
	public String updateBlackList(@PathVariable Integer id) {
		int blackList = managerService.updateBlackList(id);
		return "redirect:/manager/userDetail/{id}";
	}

	// 블랙 리스트 해제
	@GetMapping("/updateWhite/{id}")
	public String updateWhiteList(@PathVariable Integer id) {
		int blackList = managerService.updateWhiteList(id);
		return "redirect:/manager/userDetail/{id}";
	}

	// 등급 수정
	@PostMapping("/updateGrade/{id}")
	public String updateGradeProc(@PathVariable Integer id, Integer gradeId) {
		managerService.changeGradeByUserIdAndGradeId(gradeId, id);
		return "redirect:/manager/userDetail/" + id;
	}

	@GetMapping("/deleteBlackList")
	public String deleteBlackList() {
		return "redirect:/manager/";
	}

}
