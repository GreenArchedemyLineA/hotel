package com.dodam.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dodam.hotel.dto.ManagerSignInFormDto;
import com.dodam.hotel.repository.ManagerRepository;
import com.dodam.hotel.repository.model.Manager;

@Service
public class ManagerService {
	
	@Autowired //DI 처리
	private ManagerRepository managerRepository;
	
	public Manager managerSign(ManagerSignInFormDto managerSignInFormDto) {
		System.out.println(managerSignInFormDto);
		Manager managerEntity = managerRepository.findByManagernameAndPassword(managerSignInFormDto);
		return managerEntity;
	}
	
}
