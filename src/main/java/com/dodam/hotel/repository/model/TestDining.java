package com.dodam.hotel.repository.model;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class TestDining {
    private String id;
    private String name;
    private String description;
    private String location;
    private Boolean availability;
    private String statusDesc;
    private String image;
}
