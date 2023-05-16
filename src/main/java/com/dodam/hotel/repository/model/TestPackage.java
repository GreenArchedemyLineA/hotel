package com.dodam.hotel.repository.model;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class TestPackage {
    private Room room;
    private TestDining dining;
    private TestSpa spa;
    private TestPool pool;
    private TestFitness fitness;
    private Integer price;
}
