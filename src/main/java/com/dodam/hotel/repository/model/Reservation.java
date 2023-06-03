package com.dodam.hotel.repository.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class Reservation {
	
    private Integer id;
    private Date startDate;
    private Date endDate;
    @Range(min = 1, max = 5, message = "최소 1명부터 최대 5명까지 선택할 수 있습니다.")
    private Integer numberOfP;
    private Integer userId;
    private Integer roomId;
    private Integer totalPrice;
    private Timestamp createdAt;
    private Integer diningId;
    private Integer fitnessId;
    private Integer poolId;
    private Integer spaId;

    // ========= Mapping ===========
    private User user;
    private Room room;
    private Dining dining;
    private Fitness fitness;
    private Pool pool;
    private Spa spa;
    
    
}
