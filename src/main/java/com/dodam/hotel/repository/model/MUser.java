package com.dodam.hotel.repository.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class MUser {

	private int id;
	private String email;
	private String password; 
	private String name;
	private String gender;
	private String tel;
	private Date birth;
	private boolean blacklist;
	private boolean withdrawal;
	private Timestamp createdAt;
	
	
}
