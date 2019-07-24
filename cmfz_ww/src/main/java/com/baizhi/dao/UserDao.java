package com.baizhi.dao;

import com.baizhi.entity.CountMonth;
import com.baizhi.entity.User;
import com.baizhi.entity.UserDto;

import java.util.List;
import java.util.Map;

public interface UserDao {
    //查询所有用户
    public List<User> selectAll();
    //添加
    public void insert(User user);
    //删除
    public void delete(String id);
    //修改
    public void update(User user);
    //修改路径
    public void updateProfile(User user);
    //用户登录
    public User userLogin(String phoneNUmber);
    //用户注册
    public User regist(User user);
    //根据月份查询人数
    public List<CountMonth> queryByMonth();
    //根据id查询
    public User queryOne(String id);
//    修改状态
    public void updateSatus(User user);
//    按照省份分组查询
    public List<UserDto> selectByProvince();
//    按姓名查询
     public List<User> queryByName(String name);

}
