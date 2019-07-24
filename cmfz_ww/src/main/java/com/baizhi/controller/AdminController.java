package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.entity.Carouse;
import com.baizhi.entity.CarousePageDto;
import com.baizhi.service.AdminService;
import com.sun.tools.javac.tree.DCTree;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.security.auth.message.callback.SecretKeyCallback;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.SoundbankResource;
import javax.xml.ws.Response;
import java.io.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService service;
     @RequestMapping("login")
    public Map<String,Object> login(Admin admin){
         //直接接受数据，必须与表单中的数据一致
         Map<String, Object> map = service.queryAdminByName(admin);
         return map;
    }
    @RequestMapping("queryCarouse")
    public List<Carouse>queryAllCarouse(){
        List<Carouse> carouses = service.queryAllCarouse();
        return carouses;
    }
    //增删改操作
    @RequestMapping("edite")
    public String  edite(Carouse carouse,String oper,String []id){
        if("add".equals(oper)){
            String s = service.add(carouse);
            return s;
        }else if("edit".equals(oper)){
           service.modify(carouse);
           return carouse.getId();
       }else{
            for (String idd:id){
                service.remove(idd);
            }
       }
        return null;
    }
    //分页查询
    @RequestMapping("QueryByPage")
    public CarousePageDto queryByPage(Integer page,Integer rows){
        CarousePageDto carousePageDto = service.queryByPage(page, rows);
        return carousePageDto;
    }
    // 文件上传
    @RequestMapping("upload")
    public void fileupload(String id, MultipartFile path, HttpServletRequest request, HttpServletResponse response) throws IOException {
         //获取绝对路径
        String realPath = request.getSession().getServletContext().getRealPath("upload");
        //获取源文件名
        String fileName = path.getOriginalFilename();
        //判断路径是不是存在
        File file = new File(realPath);
        if(!file.exists()){
            file.mkdir();
        }
        path.transferTo(new File(realPath,fileName));
        //修改文件路径
        Carouse carouse = new Carouse();
        carouse.setId(id);
        carouse.setPath(fileName);
        service.modifyImgPath(carouse);
    }


}
