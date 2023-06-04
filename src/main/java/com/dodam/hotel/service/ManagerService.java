package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.interfaces.MUserRepository;
import com.dodam.hotel.repository.interfaces.ManagerRepository;
import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.repository.model.MembershipInfo;
import com.dodam.hotel.repository.model.Room;



@Service
public class ManagerService {

	@Autowired // DI 처리
	private ManagerRepository managerRepository;

	@Autowired
	private MUserRepository mUserRepository;

	@Autowired
	private RoomRepository roomRepository;
	
	@Transactional
	public int readAllRoomListCount() {
		int resultCount = roomRepository.findAllRoomListCount();
		return resultCount;
	}
	
	@Transactional
	public List<Room> readAllRoomList() {
		List<Room> roomEntitys = roomRepository.findAllRoomList();
		return roomEntitys;
	}

	@Transactional
	public List<Room> readConditionsRoomList(StatusParams statusParams) {
		Boolean roomStatus = statusParams.getRoomStatus();
		if(roomStatus == null) {
			statusParams.setRoomStatus(false);
		}
		Integer numberOfp = statusParams.getNumberOfP();
		Integer price = statusParams.getPrice();

		List<Room> roomEntitys;
		// where 조건 or 절 사용해도 문제 없는 조건 리스트(1개만 서치)
		// 1. 방 상태만 걸려있는 경우
		// 2. 수용 인원만 걸려있는 경우
		// 3. 가격만 걸려있는경우
		// where 조건 and 절 무조건 사용해야하는 조건 리스트(2&3개만 서치)
		// 4. 방 & 수용 인원
		if (roomStatus == null && numberOfp == null && price == null) {
			roomEntitys = roomRepository.findOptionStatusAndNumberOfpRoomList(statusParams);
		}
		// 5. 방 & 가격
		else if (roomStatus == null && numberOfp == null && price == null) {
			roomEntitys = roomRepository.findOptionStatusAndPriceRoomList(statusParams);
		}
		// 6. 수용인원 & 가격
		else if (roomStatus == null && numberOfp == null && price == null) {
			roomEntitys = roomRepository.findOptionNumberOfpAndPriceRoomList(statusParams);
		}
		// 7. 전부 옵션이 걸려있는 경우
		else if (roomStatus != null && numberOfp != null && price != null) {
			roomEntitys = roomRepository.findAllOptionRoomList(statusParams);
		} else {
			// 1,2,3 조건
			roomEntitys = roomRepository.findOptionSearchOneRoomList(statusParams);
		}
		return roomEntitys;
	}

	@Transactional
	public Room readByRoom(Integer roomId) {
		Room roomEntity = roomRepository.findById(roomId);
		return roomEntity;
	}

	// 매니저 로그인
	@Transactional
	public Manager managerSignIn(ManagerSignInFormDto managerSignInFormDto) {
		Manager managerEntity = managerRepository.findByManagernameAndPassword(managerSignInFormDto);
		
		if(managerEntity != null) {
//			    String api_key = "NCSYYRDX9Y5UNIO7";
//		        String api_secret = "YEHIFZWNUP9GCLPXD9SHND2DWEOQRIQP";
//		        Message coolsms = new Message(api_key, api_secret);
//		        HashMap<String, String> params = new HashMap<String, String>();
//
//		        params.put("to", "01052770535");
//		        params.put("from", "01038379096");
//		        params.put("type", "SMS");
//		        params.put("text", "강사님 안녕하세요!!!!!!!!!!!!!!!!!!");
//		        params.put("app_version", "test app 1.2");
//
//		        try {
//		            JSONObject obj = (JSONObject)coolsms.send(params);
//		            System.out.println(obj.toString());
//		        } catch (CoolsmsException e) {
//		            System.out.println(e.getMessage());
//		            System.out.println(e.getCode());
//		        }
		}
		
		return managerEntity;
	}

	// 회원 전체 리스트 검색
	@Transactional
	public List<MUser> readUserListAllForManager() {
		List<MUser> userListEntity = mUserRepository.findByAll();
		return userListEntity;
	}
	
	// 이름으로 회원 검색
	@Transactional
	public List<MUser> readUserByNameForManager(String name) {
		List<MUser> userListEntity = mUserRepository.findByname(name);
		return userListEntity;
	}
	
	//등급별 회원 조회
	@Transactional
	public List<GradeInfo> readUserGradeListForManager(Integer gradeId){
		List<GradeInfo> userListEntity = mUserRepository.findByGradeAll(gradeId);
		return userListEntity;
	}
	
	//블랙 리스트로 지정
	@Transactional
	public int updateBlackList(Integer id) {
		int resultRow = mUserRepository.updateBlackList(id);
		return resultRow;
	}
	
	//블랙 리스트로 해제
	@Transactional
	public int updateWhiteList(Integer id) {
		int resultRow = mUserRepository.updateWhiteList(id);
		return resultRow;
	}
	
	// 블랙리스트 조회
	@Transactional
	public List<MUser> readUserBlackListForManager() {
		List<MUser> userBlackListEntitys = mUserRepository.findByBlackList();
		return userBlackListEntitys;
	}
	
	// 블랙 리스트 탈퇴 상태 값 변경
	@Transactional
	public int updateUserWithdrawal(Integer id) {
		int resultRow = mUserRepository.updateWithdrawal(id);
		return resultRow;
	}
	
	// 블랙리스트 탈퇴시 넣어줄 오리진 이메일
	@Transactional
	public int updateUserOriginEmail(String email, Integer id) {
		int resultRow = mUserRepository.updateOriginEmail(email, id);
		return resultRow;
	}
	
	//블랙리스트 탈퇴 처리시 이메일 수정
	@Transactional
	public int updateWithdrawalEmail(String email,Integer id) {
		int resultRow = mUserRepository.updateWithdrawalEmail(email, id);
		return resultRow;
	}
	
	// 회원등급 조회
	@Transactional
	public GradeInfo readUserGrade(Integer id) {
		GradeInfo userGradeEntity = mUserRepository.findByUserId(id);
		return userGradeEntity;
	}
	
	//맴버쉽 회원 조회
	@Transactional
	public List<MembershipInfo> readByMembershipUserList(){
		List<MembershipInfo> membershipUserListEntity = mUserRepository.findByMembershipAll();
		return membershipUserListEntity;		
	}
	
	// 회원 등급 수정
	@Transactional
	public int updateGradeByUserIdAndGradeId(Integer gradeId, Integer id) {
		int resultRowCount = mUserRepository.updateGrade(gradeId, id);	
		return resultRowCount;
	}

}
