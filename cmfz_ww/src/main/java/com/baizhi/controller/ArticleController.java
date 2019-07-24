package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.entity.Guru;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("article")
public class ArticleController {
    @Autowired
    ArticleService service;
    //分页查询
    @RequestMapping("queryAll")
    public Map<String,Object> queryAll(Integer page,Integer rows,String guruId) {
        Map<String, Object> map = service.queryAll(page, rows);
        return  map;
    }
    //增删改查
    @RequestMapping("edit")
    public String edit(Article article,String oper,String[]id,String guruId){
         if("add".equals(oper)){
             article.setGuruId(guruId);
             String str = service.add(article);
             return str;
         }if("edit".equals(oper)){
             service.modify(article);
        }else{
            for (String s : id) {
                service.remove(s);
            }
        }
         return null;
    }
    //添加
    @RequestMapping("add")
    public void add(Article article){
        service.add(article);
    }

    //根据上师id查询
    @RequestMapping("queryAllByGuruId")
    public List<Article> queryALLByGuruId(String guruId){
        //根据guruId查询
        List<Article> articles = service.queryAllByGuruId(guruId);
        return articles;
    }
    //上传图片
    @RequestMapping("upload")
    public Map<String,Object> upload (MultipartFile file, HttpServletRequest request){
        //获取绝对路径
        String realPath = request.getSession().getServletContext().getRealPath("aticleUpload");
        //获取源文件名
        String originalFilename = file.getOriginalFilename();
        //判断该文件路径是不是存在
        File files = new File(realPath);
        //如果不存在则进行创建
        if(!files.exists()){
            files.mkdir();
        }
        Map<String, Object> map = new HashMap<>();
        try {
            map.put("error",0);
            map.put("url", "http://localhost:8088/cmfz/aticleUpload/"+originalFilename);
            file.transferTo(new File(realPath,originalFilename));
        } catch (IOException e) {
            e.printStackTrace();
            map.put("error",1);
            map.put("url", "http://localhost:8088/cmfz_ww/aticleUpload/"+originalFilename);
        }
        return map;
    }
    //创建图片空间
    @RequestMapping("showAll")
    public Map<String,Object>showAll(HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        map.put("current_url", "http://localhost:8088/cmfz/aticleUpload/");
        String realPath = request.getSession().getServletContext().getRealPath("aticleUpload");
        File file = new File(realPath);
        String[] list = file.list();
        int length = file.list().length;
        map.put("total_count", length);
        List<Object> array = new ArrayList<>();
        for (int i = 0; i < list.length; i++) {
             String s = list[i];
             Map<String, Object> map1 = new HashMap<>();
             map1.put("is_dir", false);
             map1.put("has_file", false);
             File files = new File(realPath,s);
             long length1 = files.length();
             map1.put("filesize",length1);
             map1.put("is_photo", true);
             String substring = s.substring(s.lastIndexOf("."));
             map1.put("filetype",substring);
             map1.put("filename", s);
             map1.put("datetime", new Date());
             array.add(map1);
        }
        map.put("file_list",array);
        return map;
    }
    @RequestMapping ("queryOneById")
    public Article queryOneById(String id){
        System.out.println(id+"11221212");
        Article article = service.queryOneById(id);
        return article;

    }
}
