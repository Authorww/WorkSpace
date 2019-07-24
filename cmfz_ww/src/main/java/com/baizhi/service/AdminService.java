package com.baizhi.service;

import com.baizhi.entity.Admin;
import com.baizhi.entity.Carouse;
import com.baizhi.entity.CarousePageDto;
import org.springframework.data.domain.PageRequest;

import java.util.List;
import java.util.Map;

public interface AdminService {
     public List<Admin>queryAll();
    //管理员登录
//    public Admin queryOne(String username,String password);
    public Map<String,Object>queryAdminByName(Admin admin);
    //查询所有轮播图
    public List<Carouse>queryAllCarouse();
    //插入轮播图
    public String add(Carouse carouse);
    //删除图
    public void remove(String id);
    //修改轮播图
    public void modify(Carouse carouse);
    //分页查询
    public CarousePageDto queryByPage(Integer page,Integer rows);
    //修改图片路径
    public void modifyImgPath(Carouse carouse);

}
