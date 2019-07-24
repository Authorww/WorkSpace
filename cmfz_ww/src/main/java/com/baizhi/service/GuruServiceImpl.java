package com.baizhi.service;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Article;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
@Service
public class GuruServiceImpl implements GuruService {
   @Autowired
    GuruDao guruDao;
    @Override
    public Map<String,Object> queryAll(Integer page, Integer rows) {
        Map<String, Object> map = new HashMap<>();
        map.put("page", page);
        Integer records = guruDao.totalRecords();
        map.put("records",records);
        Integer total = records%rows==0 ? records/rows:records/rows+1;
        map.put("total", total);
        Integer begin = (page-1)*rows;
        List<Guru> gurus = guruDao.selectAll(begin, rows);
        map.put("rows", gurus);
        return map;
    }

    @Override
    public String add(Guru guru) {
        String s = UUID.randomUUID().toString();
        guru.setId(s);
        guruDao.insert(guru);
        return s;
    }

    @Override
    public void modify(Guru guru) {
         //判断是不是现处于冻结状态
        System.out.println("4545454545");
        System.out.println("99999"+guru);
        String status = guru.getStatus();
        if (status.equals("冻结")){
            System.out.println("777777777"+guru);
            guru.setStatus("正常");
            guruDao.update(guru);
        }else if(status.equals("正常")){
            System.out.println("666666666"+guru);
            guru.setStatus("冻结");
            guruDao.update(guru);
        }else{
            guru.setStatus("冻结");
            guruDao.update(guru);
        }
    }

    @Override
    public List<Guru> queryAllGuru() {
        List<Guru> gurus = guruDao.selectAllGuru();

        return gurus;
    }

    @Override
    public void modifyProfile(Guru guru) {
        guruDao.updateProfile(guru);
    }

    @Override
    public void remove(String id) {
        guruDao.delete(id);
    }
}
