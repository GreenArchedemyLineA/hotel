package com.dodam.hotel.service;

import com.dodam.hotel.dto.PayDto;
import com.dodam.hotel.repository.interfaces.PayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PayService {
    @Autowired
    private PayRepository payRepository;
    @Transactional
    public int createPay(PayDto payDto){
        int result = payRepository.insertPay(payDto);
        return result == 1 ? 1 : 0;
    }
}
