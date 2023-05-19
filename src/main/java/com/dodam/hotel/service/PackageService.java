package com.dodam.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 
 * @author 성희
 * 패키지 서비스
 */

import com.dodam.hotel.dto.PackageDto;
import com.dodam.hotel.repository.interfaces.PackageRepository;
@Service
public class PackageService {
	
	@Autowired
	private PackageRepository packageRepository;
	
	public List<PackageDto> readPackageAll() {
		List<PackageDto> h_package = packageRepository.findAllPackage();
		return h_package;
	}
	
}
