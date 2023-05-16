package com.dodam.hotel.repository.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class User {
	
	private Integer id;
	private String email;
	private String password;
	private String name;
	private String gender;
	private Date birth;
	private String tel;
	private Boolean blacklist;
	private Boolean withdrawal;
	private Timestamp created_at;
}
