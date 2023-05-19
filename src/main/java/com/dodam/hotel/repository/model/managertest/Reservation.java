package com.dodam.hotel.repository.model.managertest;

import lombok.Data;

import java.sql.Date;

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
}
