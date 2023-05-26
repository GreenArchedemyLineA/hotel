package com.dodam.hotel.repository.model.managertest;

import com.dodam.hotel.repository.model.Dining;
import com.dodam.hotel.repository.model.User;
import lombok.Data;

import java.sql.Date;

/**
 * @author lhs-devloper
 */
@Data
public class DiningReservation {
    private Integer id;
    private Date startDate;
    private Date endDate;
    private Integer numberOfP;
    private User user;
    private Dining dining;
}
