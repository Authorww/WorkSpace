package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
/*
* 上师管理，添加冻结删除
* */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Guru {
    private String id;
    private String name;
    private String profile;
    private String status;
    private String sex;
    private List<Chapter> chapters;
}
