package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/*
* @专辑
* */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Album implements Serializable {
    private String id;
    private String title;
    private String cover;
    private Integer count;
    private Integer score;
    private String author;
    private String broadcast;
    private String brief;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GTM+8")
    private Date publishTime;
    private List<Chapter> chapterList;
}
