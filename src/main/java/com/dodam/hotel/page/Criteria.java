package com.dodam.hotel.page;

import lombok.Data;

@Data
public class Criteria {

	private Integer page; // 현재 페이지 번호
	private Integer recordSize;// 한페이지 출력할 데이터 개수
	private Integer pageSize; //화면 하단에 출력할 페이지 사이즈
	private String keyword; //검색 키워드
	private String searchType; //검색 유형
	private Pagination pagination;
	
	public Criteria() {
		this.page = 1;
		this.recordSize = 10;
		this.pageSize = 10;
	}
	
	public Integer getOffset() {
		return (page - 1) * recordSize;
	}
	
}
