package com.dodam.hotel.repository.model.managertest;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class Fitness {
    private Integer id;
    private String hours;
    private Boolean availability;
    private String statusDesc;
    private Facilities facilities;
}
