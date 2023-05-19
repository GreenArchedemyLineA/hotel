package com.dodam.hotel.repository.model.managertest;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

import com.dodam.hotel.repository.model.Dining;
import com.dodam.hotel.repository.model.Fitness;
import com.dodam.hotel.repository.model.Package;
import com.dodam.hotel.repository.model.Pool;
import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.Spa;
import com.dodam.hotel.repository.model.User;

/**
 * @author lhs-devloper
 */
@Data
public class Reservation {
    private Integer id;
    private Date startDate;
    private Date endDate;
    private Integer numberOfp;
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
    private PackageTB h_package;
    private Fitness fitness;
    private Pool pool;
    private Spa spa;
    
    
	private Integer numberOfP;
}
