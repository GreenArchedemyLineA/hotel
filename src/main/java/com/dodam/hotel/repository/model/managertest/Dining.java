package com.dodam.hotel.repository.model.managertest;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class Dining {
    private Integer id;
    private String name;
    private String hours;
    private String location;
    private Boolean availability;
    private String statusDesc;
    private String image1;
    private String image2;
    private String image3;
}
