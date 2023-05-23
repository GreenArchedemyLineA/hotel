package com.dodam.hotel.repository.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Reservation {
	
    private Integer id;
    private Date startDate;
    private Date endDate;
    private Integer numberOfP;
    private Integer userId;
    private Integer roomId;
    private Integer totalPrice;
    private Timestamp createdAt;
    private Integer diningId;
    private Integer packageId;
    private Integer fitnessId;
    private Integer poolId;
    private Integer spaId;

    // ========= Mapping ===========
    private User user;
    private Room room;
    private Dining dining;
    private Package h_package;
    private Fitness fitness;
    private Pool pool;
    private Spa spa;
    
    
}
