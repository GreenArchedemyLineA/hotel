package com.dodam.hotel.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MembershipInfo {
	
	private User user;
	private Membership membership;
	private Timestamp updatedAt;
}
