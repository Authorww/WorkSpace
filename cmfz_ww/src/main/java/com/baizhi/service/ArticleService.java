package com.baizhi.service;

import com.baizhi.entity.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {
    public String add(Article article);
    //删除
    public void remove(String id);
    //修改
    public void modify(Article article);
    //分页查询
    public Map<String,Object>queryAll(Integer page,Integer rows);
    //格局GuruId 查询
    public List<Article > queryAllByGuruId(String guruId);
    //根据id查询一个
    public Article queryOneById(String id);

}
