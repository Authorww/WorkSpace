package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("album")
public class AlbumController {
    @Autowired
    AlbumService service;
    //查询所有
    @RequestMapping("queryAll")
    public List<Album> queryAll(){
        List<Album> albums = service.queryAll();
        return albums;
    }
    //添加删除操作,批量删除
    @RequestMapping("edite")
    public String edite(Album album,String oper,String[]id){
        if("add".equals(oper)){
            String s = service.add(album);
            return s;
        }else if("edit".equals(oper)){
            service.modify(album);
        }else {
            for (String s : id) {
                service.deleteById(s);
            }
        }
         return null;
    }
    //分页查询
    @RequestMapping("queryByPage")
    public Map<String,Object> queryByPage(Integer page, Integer rows){
        Map<String, Object> stringObjectMap = service.queryByPage(page, rows);
        return  stringObjectMap;
    }
   //文件上传
    @RequestMapping("imgUpload")
    public void imgUpload(String id,MultipartFile cover, HttpServletRequest request, HttpServletResponse response){
        //获取绝对路径
        String path = request.getSession().getServletContext().getRealPath("imgCover");
        //获取原始文件名
        String originalFilename = cover.getOriginalFilename();
        //将文件上传到指定位置
        File file = new File(path);
        if(!file.exists()){
            file.mkdir();
        }
        try {
            cover.transferTo(new File(path,originalFilename));
            //修改文件路径
            Album album = new Album();
            album.setId(id);
            album.setCover(originalFilename);
            service.modifyPath(album);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //查询所有Chapter
    @RequestMapping("queryAllChapter")
    public List<Chapter> queryAllChapter(String id){
        List<Chapter> chapters = service.queryAllChapter(id);
        return chapters;
    }
    //编辑章节
    @RequestMapping("editeChapter")
    public String editeChapter(Chapter chapter,String oper,String[]id,String rowId){
        if("add".equals(oper)){
            chapter.setAlbumId(rowId);
            String s = service.addChapter(chapter);
            return s;
        }else {
            for (String s : id) {
                service.remove(s);
            }
        }
        return null;

    }
    @RequestMapping("chapterUpload")
    public void chapterUpload (MultipartFile downPath,HttpServletRequest request,HttpServletResponse response,String id){
             //获取绝对路径
        String chapterUpload = request.getSession().getServletContext().getRealPath("music");
           //获取原始文件名
        String originalFilename = downPath.getOriginalFilename();
        File file = new File(chapterUpload);
        if(!file.exists()){
            file.mkdir();
        }
        //获取文件大小
        long size = downPath.getSize();
        double length = size+0.0;
        try {
            downPath.transferTo(new File(chapterUpload,originalFilename));
            //创建Chapter
            Chapter chapter = new Chapter();
            chapter.setId(id);
            chapter.setSize(length);
            chapter.setDownPath(originalFilename);
            service.updateDownPath(chapter);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //文件下载
    @RequestMapping("downLoad")
    public void downLoad(String downPath,HttpServletResponse response,HttpServletRequest request) throws IOException {
         //获取绝对路径
        String realPath = request.getSession().getServletContext().getRealPath("music");
        //获取当前对象
        File file = new File(realPath, downPath);
        //获取文件类型
        String substring = downPath.substring(downPath.lastIndexOf("."));
        response.setContentType(request.getSession().getServletContext().getMimeType(substring));
        //设置响应头
        response.setHeader("content-disposition","attachment;fileName="+ URLEncoder.encode(downPath,"UTF-8"));
        //将文件响应到浏览器
        FileCopyUtils.copy(new FileInputStream(file),response.getOutputStream());
    }

}
