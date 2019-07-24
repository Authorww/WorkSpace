package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;

import java.util.List;
import java.util.Map;

public interface AlbumService {
    //查询所有
    public List<Album> queryAll();
    //删除
    public void deleteById(String id);
    //插入
    public String add(Album album);
    //分页查询
    public Map<String,Object> queryByPage(Integer page, Integer rows);
    //修改专辑
    public void modify(Album album);
    //修改文件路径
    public void modifyPath(Album album);
    //查询所有Chapter
    public List<Chapter> queryAllChapter(String id);
    //删除Chapter
    public void remove(String id);
    //插入Chapter
    public String addChapter(Chapter chapter);
    //修改路径
    public void updateDownPath(Chapter chapter);

}
