package com.dodam.hotel.repository.model;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class TestFitness {
    private Integer id;
    private Boolean availability;
    private String statusDesc;
    private TestFacilities facilities;
}
