package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class User {
	
	private Integer id;
	private String email;
	private String password;
	private String name;
	private String gender;
	private String birth;
	private String tel;
	private boolean blacklist;
	private boolean withdrawal;
	private Timestamp created_at;
}
