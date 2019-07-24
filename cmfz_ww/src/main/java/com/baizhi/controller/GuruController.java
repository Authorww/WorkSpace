package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SoundbankResource;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("guru")
public class GuruController {
    @Autowired
    GuruService service;
    //增删改操作上师
    @RequestMapping("edit")
    public String edit(Guru guru,String oper,String[]id){
          if("add".equals(oper)){
              String add = service.add(guru);

              return add;
          }else if("edit".equals(oper)){
              service.modify(guru);
              return guru.getId();
        }else{
              for (String s : id) {
                  service.remove(s);
              }

          }
          return null;
    }
    //分页查询所有的上师
    @RequestMapping("queryByPage")
    public Map<String,Object>queryByPage(Integer page,Integer rows){
        Map<String, Object> map = service.queryAll(page, rows);
        return map;
    }
    //查询所有上师
    @RequestMapping("queryAll")
        public List<Guru> queryAll(){
        List<Guru> gurus = service.queryAllGuru();
        return gurus;
    }

    //头像上传
    @RequestMapping("upload")
    public void uploadHeader(MultipartFile profile, HttpServletRequest request, HttpServletResponse response,String id){
        //获取绝对路径
        String realPath = request.getSession().getServletContext().getRealPath("imgHeader");
        //获取原始文件名
        String originalFilename = profile.getOriginalFilename();
        File file = new File(realPath);
        if(!file.exists()){
            file.mkdir();
        }
        try {
            profile.transferTo(new File(realPath,originalFilename));
            //改变图片路径
            Guru guru = new Guru();
            guru.setProfile(originalFilename);
            guru.setId(id);
            service.modifyProfile(guru);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
