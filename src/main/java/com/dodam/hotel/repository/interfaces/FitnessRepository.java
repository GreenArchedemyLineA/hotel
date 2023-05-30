package com.dodam.hotel.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.Fitness;

/**
 * @author lhs-devloper
 */
@Mapper
public interface FitnessRepository {
    List<Fitness> findAllFitness();
}
