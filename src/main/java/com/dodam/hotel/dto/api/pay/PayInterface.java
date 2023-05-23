package com.dodam.hotel.dto.api.pay;

public interface PayInterface {
    PayReadyResponse payReady();
    PayApproveRequest payApprove(String token);
}
