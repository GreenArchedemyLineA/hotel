package com.dodam.hotel.repository.model;

import lombok.Builder;
import lombok.Data;

/**
 * @Author lhs-devloper
 * Room Data
 */
@Data
public class Room {
    private Integer id;
    private String name;
    private Integer price;
    private Boolean availability;
    private String description;
    private String image;
    private String statusDesc;
    private Integer numberOfp;
}
