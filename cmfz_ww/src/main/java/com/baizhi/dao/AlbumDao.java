package com.baizhi.dao;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumDao {
    //查询所有
    public List<Album> selectAll();
    //删除
    public void delete(String id);
    //添加
    public void insert(Album album);
    //查询总条数
    public Integer totalRecords();
    //查询当前页数据
    public List<Album>queryByPage(@Param("begin") Integer begin,@Param("rows") Integer rows);
    //修改专辑
    public void update(Album album);
    //修改文件路径
    public void updatePath(Album album);

    //查询chapter
    public List<Chapter>selectAllChapter(String id);
    //添加
    public void insertChapter(Chapter chapter);
    //删除delete Chapter
    public void deleteChapter(String id);
    //修改路径
    public void updateDownPath(Chapter chapter);

}
