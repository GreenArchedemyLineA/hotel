package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.Pool;

/**
 * @author lhs-devloper
 */
@Mapper
public interface PoolRepository {
    List<Pool> findAllPool();
}
