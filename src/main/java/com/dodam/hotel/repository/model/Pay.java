package com.dodam.hotel.repository.model;

import com.dodam.hotel.enums.Grade;
import com.dodam.hotel.enums.PGType;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class Pay {
    private Integer id;
    private String payTid;
    private Integer price;
    private Timestamp createdAt;
    private PGType pgType;
    private String grade;
}
