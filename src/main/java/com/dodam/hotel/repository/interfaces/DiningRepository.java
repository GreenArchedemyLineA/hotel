package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.repository.model.managertest.Dining;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author lhs-devloper
 */
@Mapper
public interface DiningRepository {
    List<Dining> findAllDining();
}
