package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CarousePageDto {
    private Integer page;   //当前页
    private Integer records;   //总行数
    private Integer total; //总页数
    private List<Carouse> rows ;  //该页数据
}
