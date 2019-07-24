package com.baizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.baizhi.dao")
public class PSVM {
    public static void main(String[] args) {
        SpringApplication.run(PSVM.class, args);
    }

}
