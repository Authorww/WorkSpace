package com.baizhi.dao;

import com.baizhi.entity.Guru;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GuruDao {
    //分页查询所有上师
    public List<Guru> selectAll(@Param("begin") Integer begin,@Param("rows") Integer rows);
    //添加上师
    public void insert(Guru guru);
    //修改上师状态
    public void update(Guru Guru);
    //查询所有条数
    public Integer totalRecords();
    //查询所有上师
   public List<Guru> selectAllGuru();
   //更改文件路径
    public void updateProfile(Guru guru);
    //删除
    public void delete(String id);


}
