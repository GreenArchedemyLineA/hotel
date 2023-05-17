package com.dodam.hotel.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {

	public static Date dateFormat(String date) {
		SimpleDateFormat formatter = new SimpleDateFormat(date);
		
		Date formatDate = null;
		try {
			formatDate = formatter.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return formatDate;
	}
	
}
