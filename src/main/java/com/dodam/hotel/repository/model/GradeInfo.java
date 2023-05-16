package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GradeInfo {
	
	private Integer userId;
	private Integer gradeId;
	private Timestamp updatedAt;
	//map
	private Grade grade;
	private MUser muser;
}
