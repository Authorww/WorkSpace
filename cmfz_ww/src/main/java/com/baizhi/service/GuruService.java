package com.baizhi.service;

import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface GuruService {

    //分页查询所有上师
       public Map<String,Object> queryAll(Integer page, Integer rows);
    //    //添加上师
      public String add(Guru Guru);
    //    //修改上师状态
      public void modify(Guru Guru);
      //查询所有上师
    public List<Guru>queryAllGuru();
    //根据guruId查询所有文章
    //跟该文章路径
    public void modifyProfile(Guru guru);
    //删除
    public void remove(String id);



}
