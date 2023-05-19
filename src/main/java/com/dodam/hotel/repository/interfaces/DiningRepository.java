package com.dodam.hotel.repository.interfaces;


import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.dodam.hotel.repository.model.Dining;
import com.dodam.hotel.repository.model.DiningDesc;


/**
 * @author lhs-devloper
 */
@Mapper
public interface DiningRepository {
    List<Dining> findAllDining();
    public List<DiningDesc> findByTypeAllDining(String type);
}
