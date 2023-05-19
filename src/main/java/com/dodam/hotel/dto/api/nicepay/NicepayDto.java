package com.dodam.hotel.dto.api.nicepay;

import lombok.Data;

@Data
public class NicepayDto {
    private String tid;
    private Long amount;
    private String orderId;
}
