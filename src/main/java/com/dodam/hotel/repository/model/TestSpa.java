package com.dodam.hotel.repository.model;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class TestSpa {
    private Integer id;
    private Boolean availability;
    private String status_desc;
    private TestFacilities facilities;
}
