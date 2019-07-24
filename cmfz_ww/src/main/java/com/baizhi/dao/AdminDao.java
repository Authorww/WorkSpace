package com.baizhi.dao;

import com.baizhi.entity.Admin;
import com.baizhi.entity.Carouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminDao {

    public List<Admin>selectAll();
    //登录
    public Admin selectOne(String username);
    //查询所有轮播图
    public List<Carouse>selectAllCarouse();
    //插入轮播图
    public void insert(Carouse carouse);
    //删除图
    public void delete(String id);
    //修改轮播图
    public void update(Carouse carouse);
    //查询总条数
    public Integer totalCount();
    //查询当前页数据，参数当前页数，与每页显示条数
    public List<Carouse> queryByPage(@Param("page") Integer page,@Param("rows") Integer rows);
    //修改数据库文件路径
    public void updateImhPath(Carouse carouse);
}
