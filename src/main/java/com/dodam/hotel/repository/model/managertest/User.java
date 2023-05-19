package com.dodam.hotel.repository.model.managertest;

import com.dodam.hotel.repository.model.managertest.enums.Geneder;
import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * @author lhs-devloper
 */
@Data
public class User {
    private Integer id;
    private String email;
    private String password;
    private String name;
    private Geneder gender;
    private Date birth;
    private String tel;
    private Boolean blacklist;
    private Boolean withdrawal;
    private Timestamp created_at;
}
