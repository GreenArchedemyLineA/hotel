package com.dodam.hotel.dto.api.tosspay;

import lombok.Data;

@Data
public class TossPaymentRequestDto {
    private String method;
    private Integer amount;
    private String orderId;
    private String orderName;
    private String successUrl;
    private String failUrl;
    private String flowMode;
    private String easyPay;
    private String cardCompany;
    private String appSchema;
}
