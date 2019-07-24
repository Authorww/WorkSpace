package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
/*
* 轮播图
*
* */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Carouse implements Serializable {
    private String id;
    private String title;
    private String path;
    private String status;
    @JsonFormat(pattern = "YYYY-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "YYYY-MM-dd")
    private Date createTime;
}
