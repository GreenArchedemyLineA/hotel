package com.dodam.hotel.repository.model.managertest;

import com.dodam.hotel.repository.model.Room;
import com.dodam.hotel.repository.model.managertest.*;
import com.dodam.hotel.repository.model.managertest.PackageTB;
import lombok.Data;

import java.sql.Date;

/**
 * @author lhs-devloper
 */
@Data
public class Reservation {
    private Integer id;
    private Date start_date;
    private Date end_date;
    private Integer numberOfp;
    private User user;
    private Room room;
    private Dining dining;
    private PackageTB h_package;
    private Fitness fitness;
    private Pool pool;
    private Spa spa;
}
