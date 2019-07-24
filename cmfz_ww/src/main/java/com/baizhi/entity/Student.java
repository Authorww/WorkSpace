package com.baizhi.entity;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    @StuAnotation(name="编号")
    private String id;
    @StuAnotation(name="姓名")
    private String name;
    @StuAnotation(name="密码")
    private String password;
}
