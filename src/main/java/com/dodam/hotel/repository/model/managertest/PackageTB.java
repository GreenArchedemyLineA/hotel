package com.dodam.hotel.repository.model.managertest;

import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class PackageTB {
    private Integer id;
    private Integer roomId;
    private Integer diningId;
    private Integer spaId;
    private Integer poolId;
    private Integer fitnessId;
    private String name;
    private Integer price;
    private Room room;
    private Dining dining;
    private Spa spa;
    private Pool pool;
    private Fitness fitness;
}
