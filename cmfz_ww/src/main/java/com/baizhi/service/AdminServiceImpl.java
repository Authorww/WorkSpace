package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.entity.Carouse;
import com.baizhi.entity.CarousePageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.sound.midi.SoundbankResource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao dao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Admin> queryAll() {
        List<Admin> admins = dao.selectAll();
        return admins;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Map<String, Object> queryAdminByName(Admin admin) {
        Admin admin1 = dao.selectOne(admin.getUsername());
        Map<String, Object> map = new HashMap<>();
        if (admin1==null){
            map.put("code", 300);
            map.put("message","用户名不存在");
        }else if(admin.getPassword().equals(admin1.getPassword())){
            map.put("code", 200);
        }else{
            map.put("code", 400);
            map.put("message", "密码错误");
        }
        return map;
    }

    @Override
    public List<Carouse> queryAllCarouse() {
        List<Carouse> carouses = dao.selectAllCarouse();
        return carouses;
    }

    @Override
    public String add(Carouse carouse) {
        String s = UUID.randomUUID().toString();
        carouse.setId(s);
        dao.insert(carouse);
        return s;
    }

    @Override
    public void remove(String id) {
        dao.delete(id);
    }

    @Override
    public void modify(Carouse carouse) {
        dao.update(carouse);
    }

    @Override
    public CarousePageDto queryByPage(Integer page, Integer rows) {
        CarousePageDto carousePageDto = new CarousePageDto();
        Integer count = dao.totalCount();
        List<Carouse> carouses = dao.queryByPage(page, rows);
        //总行
        carousePageDto.setRecords(count);
        //该页数据
        carousePageDto.setRows(carouses);
        //总页数，总行数除以每页显示行
       Integer total = count%rows==0 ? count/rows : count/rows +1;
       carousePageDto.setTotal(total);
       //当前页数
       carousePageDto.setPage(page);
        return carousePageDto;
    }
    @Override
    public void modifyImgPath(Carouse carouse) {
        dao.updateImhPath(carouse);
    }


}
