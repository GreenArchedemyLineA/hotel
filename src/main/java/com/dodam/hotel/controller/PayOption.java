package com.dodam.hotel.controller;

import lombok.Data;

@Data
public class PayOption {
    private String paySelect;
    private String clientKey;
    private Integer total_amount;
    private String orderName;
}
