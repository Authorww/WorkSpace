package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    ArticleDao articleDao;
    @Override
    public String add(Article article) {
        String s = UUID.randomUUID().toString();
        article.setId(s);
        articleDao.insert(article);
        return s;
    }

    @Override
    public void remove(String id) {
        articleDao.delete(id);
    }

    @Override
    public void modify(Article article) {
        articleDao.update(article);
    }
    //分页查询
    @Override
    public Map<String, Object> queryAll(Integer page, Integer rows) {
        Map<String, Object> map = new HashMap<>();
        //将当前页存入map
        map.put("page", page);
        //查询总条数
        Integer records = articleDao.totalRecords();
        map.put("records",records);
        //运算总页数将总页数存入集合中
        Integer total = records%rows==0 ? records/rows:records/rows+1;
        map.put("total", total);
        //查询当前页的数据并存入map集合中
        //计算当前页的起始页码
        Integer begin = (page-1)*rows;
        List<Article> articles = articleDao.queryByPage(begin,rows);
        map.put("rows", articles);
        return map;
    }

    @Override
    public List<Article> queryAllByGuruId(String guruId) {
        List<Article> articles = articleDao.selectAllByGuruId(guruId);

        return articles;
    }

    @Override
    public Article queryOneById(String id) {
        Article article = articleDao.selectOneById(id);
        return article;
    }
}
