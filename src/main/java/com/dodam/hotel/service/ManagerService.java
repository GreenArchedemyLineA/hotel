package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.dto.StatusParams;
import com.dodam.hotel.repository.interfaces.MUserRepository;
import com.dodam.hotel.repository.interfaces.ManagerRepository;
import com.dodam.hotel.repository.interfaces.RoomRepository;
import com.dodam.hotel.repository.model.GradeInfo;
import com.dodam.hotel.repository.model.MUser;
import com.dodam.hotel.repository.model.Manager;
import com.dodam.hotel.repository.model.Room;

@Service
public class ManagerService {

	@Autowired // DI 처리
	private ManagerRepository managerRepository;

	@Autowired
	private MUserRepository mUserRepository;

	@Autowired
	private RoomRepository roomRepository;

	public List<Room> findAllRoomList() {
		List<Room> rooms = roomRepository.findAllRoomList();
		return rooms;
	}

	public List<Room> findConditionsRoomList(StatusParams statusParams) {
		Boolean roomStatus = statusParams.getRoomStatus();
		Integer numberOfp = statusParams.getNumberOfp();
		Integer price = statusParams.getPrice();

		List<Room> rooms;
		// where 조건 or 절 사용해도 문제 없는 조건 리스트(1개만 서치)
		// 1. 방 상태만 걸려있는 경우
		// 2. 수용 인원만 걸려있는 경우
		// 3. 가격만 걸려있는경우
		// where 조건 and 절 무조건 사용해야하는 조건 리스트(2&3개만 서치)
		// 4. 방 & 수용 인원
		if (roomStatus == null && numberOfp == null && price == null) {
			rooms = roomRepository.findOptionStatusAndNumberOfpRoomList(statusParams);
		}
		// 5. 방 & 가격
		else if (roomStatus == null && numberOfp == null && price == null) {
			rooms = roomRepository.findOptionStatusAndPriceRoomList(statusParams);
		}
		// 6. 수용인원 & 가격
		else if (roomStatus == null && numberOfp == null && price == null) {
			rooms = roomRepository.findOptionNumberOfpAndPriceRoomList(statusParams);
		}
		// 7. 전부 옵션이 걸려있는 경우
		else if (roomStatus != null && numberOfp != null && price != null) {
			rooms = roomRepository.findAllOptionRoomList(statusParams);
		} else {
			// 1,2,3 조건
			rooms = roomRepository.findOptionSearchOneRoomList(statusParams);
		}
		return rooms;
	}

	public Room findByRoom(Integer roomId) {
		Room room = roomRepository.findById(roomId);
		return room;
	}

	// 매니저 로그인
	public Manager managerSign(ManagerSignInFormDto managerSignInFormDto) {
		System.out.println(managerSignInFormDto);
		Manager managerEntity = managerRepository.findByManagernameAndPassword(managerSignInFormDto);
		return managerEntity;
	}

	// 회원 전체 리스트 검색
	public List<MUser> managerUserListAll() {
		List<MUser> userListEntity = mUserRepository.findByAll();
		return userListEntity;
	}
	
	
	// 이름으로 회원 검색
	public List<MUser> managerUserList(String name) {
		List<MUser> userListEntity = mUserRepository.findByname(name);
		return userListEntity;
	}
	
	//블랙 리스트로 지정
	public int updateBlackList(Integer id) {
		int updateBlackList = mUserRepository.updateBlackList(id);
		return updateBlackList;
	}
	
	//블랙 리스트로 해제
	public int updateWhiteList(Integer id) {
		int updateBlackList = mUserRepository.updateWhiteList(id);
		return updateBlackList;
	}
	
	// 블랙리스트 조회
	public List<MUser> managerUserBlackList() {
		List<MUser> userBlackListEntity = mUserRepository.findByBlackList();
		return userBlackListEntity;
	}
	
	// 블랙 리스트 탈퇴 상태 값 변경
	public int userUpdateWithdrawal(Integer id) {
		int userWithdrawalEntity = mUserRepository.updateWithdrawal(id);
		return userWithdrawalEntity;
	}
	// 블랙리스트 탈퇴시 넣어줄 오리진 이메일
	public int userUpdateOriginEmail(String email, Integer id) {
		int userUpdateOriginEmailEntity = mUserRepository.updateOriginEmail(email, id);
		return userUpdateOriginEmailEntity;
	}
	//블랙리스트 탈퇴 처리시 이메일 수정
	public int withdrawalEmail(String email,Integer id) {
		int withdrawalUserEmailEntity = mUserRepository.updateWithdrawalEmail(email, id);
		return withdrawalUserEmailEntity;
	}
	
	
	// 회원등급 조회
	public GradeInfo selectUserGrade(Integer id) {
		GradeInfo userGradeEntity = mUserRepository.findByUserId(id);
		return userGradeEntity;
	}

	// 회원 등급 수정()
	public int changeGradeByUserIdAndGradeId(Integer gradeId, Integer id) {
		int resultRowCount = mUserRepository.updateGrade(gradeId, id);
		
		return resultRowCount;
	}

}
