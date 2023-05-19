package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.repository.model.managertest.Fitness;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author lhs-devloper
 */
@Mapper
public interface FitnessRepository {
    List<Fitness> findAllFitness();
}
