package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.repository.model.managertest.PackageTB;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author lhs-devloper
 */
@Mapper
public interface PackageRepository {
    List<PackageTB> findAllPackage();
    List<PackageTB> findPackageList();
}
