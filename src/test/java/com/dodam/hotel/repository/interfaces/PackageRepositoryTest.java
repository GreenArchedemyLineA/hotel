package com.dodam.hotel.repository.interfaces;

import com.dodam.hotel.repository.model.managertest.PackageTB;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.context.annotation.Import;

import java.util.List;


/**
 * @author lhs-devloper
 * MyBatis-testCode(FAQ find, insert, update, delete)
 */
@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import(PackageTB.class)
public class PackageRepositoryTest {
    @Autowired
    private PackageRepository packageRepository;
    @Test
    public void PackageFind(){
        List<PackageTB> h_package= packageRepository.findAllPackage();
        System.out.println("================================================");
        h_package.stream().forEach((packageTB)->{
            System.out.println(packageTB);
            System.out.println("roomId:" + packageTB.getRoom().getId());
        });
//        System.out.println("hello");
    }
}