package com.dodam.hotel.dto.api.nicepay;

import lombok.Data;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Data
public class NicepayResultDto {
    private String resultCode;
    private String resultMsg;
    private String tid;
    private String cancelledTid;
    private String orderId;
    private String ediDate;
    private String signature;
    private String status;
    private String paidAt;
    private String failedAt;
    private String cancelledAt;
    private String payMethod;
    private Long amount;
    private Long balanceAmt;
    private String goodsName;
    private String mailReserved;
    private Boolean useEscrow;
    private String currency;
    private String approvNo;
    private String buyerName;
    private String buyerTel;
    private String receiptUrl;
    private String mallUserId;
    private Boolean issuedCashReceipt;
    private NicepayCoupon coupon;

    private NicepayCard card;
    private NicepayVBank vbank;
    private NicepayBank bank;
    private String cancels;
    private List<NicepayCashReceipts> cashReceipts;
}