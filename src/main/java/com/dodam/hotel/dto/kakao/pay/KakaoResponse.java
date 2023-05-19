package com.dodam.hotel.dto.kakao.pay;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;

import java.sql.Date;

/**
 * @author lhs-devloper
 */
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
@Data
public class KakaoResponse {
    private String aid;
    private String tid;
    private String cid;
    private String sid;

    private String partnerOrderId;
    private String partnerUserId;

    private String paymentMethodType;
    private KakaoAmount amount;
//    private KakaoCardInfo cardInfo;
    private String itemName;
    private String itemCode;
    private Integer quantity;
    private Date createdAt;
    private Date approvedAt;
    private String payload;
}
