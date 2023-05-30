package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.Spa;

/**
 * @author lhs-devloper
 */
@Mapper
public interface SpaRepository {
    List<Spa> findAllSpa();
}
