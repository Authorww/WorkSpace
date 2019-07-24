package com.baizhi.dao;

import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface ArticleDao {
    //删除
    public void delete(String id);
    //添加
    public void insert(Article article);
    //查询总条数
    public Integer totalRecords();
    //查询当前页数据
    public List<Article> queryByPage(@Param("begin") Integer begin, @Param("rows") Integer rows);
    //修改专辑
    public void update(Article article);
    //修改文件路径
    public void updatePath(Article article);
    //根据GuduId 查询
    public List<Article>selectAllByGuruId(String guruId);
    //根据id查询
    public Article selectOneById(String id);
}
