package com.dodam.hotel.dto.api.nicepay;

import com.dodam.hotel.dto.api.pay.PayApproveRequest;
import com.dodam.hotel.dto.api.pay.PayInterface;
import com.dodam.hotel.dto.api.pay.PayReadyResponse;

public class NicePay implements PayInterface {

    @Override
    public PayReadyResponse payReady() {
        return null;
    }

    @Override
    public PayApproveRequest payApprove(String pgToken) {
        return null;
    }
}
