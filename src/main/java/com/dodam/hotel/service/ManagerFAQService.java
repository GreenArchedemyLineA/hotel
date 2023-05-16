package com.dodam.hotel.service;

import com.dodam.hotel.repository.interfaces.FAQRepository;
import com.dodam.hotel.repository.model.FAQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author lhs-devloper
 * FAQ_TB 관리
 * ServiceLayer
 * CUD만 트랜잭션 걸어둠 (select는 걸 필요없다 판단하여 다음과 같이 구성)
 */
@Service
public class ManagerFAQService {
    @Autowired
    private FAQRepository faqRepository;

    public List<FAQ> findAllFAQ(){
        List<FAQ> faqList = faqRepository.findAllFAQ();
        return faqList;
    }

    public FAQ findFAQById(Integer id){
        FAQ faqList = faqRepository.findFAQById(id);
        return faqList;
    }

    @Transactional
    public int createFAQ(FAQ faq){
        int result = faqRepository.insertFAQ(faq);
        return result;
    }
    @Transactional
    public int updateFAQ(FAQ faq){
        int result = faqRepository.updateFAQById(faq);
        return result;
    }
    @Transactional
    public int deleteFAQ(Integer id){
        int result = faqRepository.deleteFAQById(id);
        return result;
    }
}
