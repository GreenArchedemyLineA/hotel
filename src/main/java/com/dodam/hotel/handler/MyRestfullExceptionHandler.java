package com.dodam.hotel.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.dodam.hotel.handler.exception.CustomRestFullException;
import com.dodam.hotel.handler.exception.LoginException;
import com.dodam.hotel.handler.exception.ManagerLoginException;

@RestControllerAdvice
public class MyRestfullExceptionHandler {
	
	
	@ExceptionHandler(CustomRestFullException.class)
	public String basicException(CustomRestFullException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+e.getMessage()+"');");
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	
	@ExceptionHandler(LoginException.class)
	public String loginException(LoginException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+e.getMessage()+"');");
		sb.append("location.href='/login';");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	@ExceptionHandler(ManagerLoginException.class)
	public String loginException(ManagerLoginException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+e.getMessage()+"');");
		sb.append("location.href='/manager/managerPage';");
		sb.append("</script>");
		
		return sb.toString();
	}
	
}
