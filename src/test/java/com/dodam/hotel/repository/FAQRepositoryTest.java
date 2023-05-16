package com.dodam.hotel.repository;

import com.dodam.hotel.repository.interfaces.FAQRepository;
import com.dodam.hotel.repository.model.FAQ;
import com.dodam.hotel.repository.model.Room;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.context.annotation.Import;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

/**
 * @author lhs-devloper
 * MyBatis-testCode(FAQ find, insert, update, delete)
 */
@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import(FAQ.class)
public class FAQRepositoryTest {
    @Autowired
    private FAQRepository faqRepository;


    @Test
    public void testFindFAQ(){
        // given
        // when
        List<FAQ> faqList = faqRepository.findAllFAQ();
        FAQ faq = faqRepository.findFAQById(1);
        System.out.println(faq);
        // then
        Assertions.assertEquals(1, faqList.size());
        Assertions.assertEquals(null, faq);
    }

    @Test
    public void failTestInsertFAQ(){
        // given

        FAQ faq = new FAQ();
        // when
        int result;
        try{
            result = faqRepository.insertFAQ(faq);
        }catch (Exception e){
            result = 0;
        }
        // then
        Assertions.assertEquals(0, result);
    }

    @Test
    public void successTestInsertFAQ(){
        // given
        FAQ faq = new FAQ();
        faq.setTitle("test");
        faq.setContent("test");
        // when
        int result = faqRepository.insertFAQ(faq);
        // then
        Assertions.assertEquals(1, result);
    }
    @Test
    public void testUpdateFAQ(){
        // given
        FAQ faq = new FAQ();
        faq.setId(2);
        faq.setTitle("test3");
        faq.setContent("test3");
        // when
        int result = faqRepository.updateFAQById(faq);
        // then
        Assertions.assertEquals(1, result);
    }

    @Test
    public void testDeleteFAQ(){
        // given
        int id = 2;
        // when
        int result = faqRepository.deleteFAQById(id);
        // then
        Assertions.assertEquals(1, result);
    }
}
