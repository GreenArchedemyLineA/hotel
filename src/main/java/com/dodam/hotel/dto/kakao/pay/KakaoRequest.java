package com.dodam.hotel.dto.kakao.pay;

import com.dodam.hotel.interfaces.PayRequest;
import lombok.Data;

/**
 * @author lhs-devloper
 */
@Data
public class KakaoRequest implements PayRequest {
    private String cid;
    private String cid_secret;
    private String tid;
    private String partner_order_id;
    private String partner_user_id;
    private String pg_token;
    private String payload;
    private Integer total_amount;
}
