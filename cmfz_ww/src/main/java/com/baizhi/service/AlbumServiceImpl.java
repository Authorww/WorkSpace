package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
@Transactional
@Service
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    AlbumDao dao;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Album> queryAll() {
        List<Album> albums = dao.selectAll();
        return albums;
    }

    @Override
    public void deleteById(String id) {
        dao.delete(id);
    }

    @Override
    public String add(Album album) {
        String s = UUID.randomUUID().toString();
        album.setId(s);
        dao.insert(album);
        return s;
    }
    //分页
    @Override
    public Map<String,Object> queryByPage(Integer page,Integer rows) {
        //查询总条数
        Integer count = dao.totalRecords();
       Map<String, Object> map = new HashMap<>();
        //总条数
        map.put("records", count);
        //总页数
        Integer total = count%rows==0 ? count/rows : count/rows +1;
        map.put("total", total);
        //本页数据,起始页码
        Integer begin = (page-1)*rows;
        List<Album> albums = dao.queryByPage(begin, rows);
        map.put("rows", albums);
        map.put("page", page);
        return map;
    }

    @Override
    public void modify(Album album) {
        dao.update(album);
    }

    @Override
    public void modifyPath(Album album) {
        dao.updatePath(album);
    }

    @Override
    public List<Chapter> queryAllChapter(String id) {
        List<Chapter> chapters = dao.selectAllChapter(id);
        return chapters;
    }
    //删除章节
    @Override
    public void remove(String id) {
        dao.deleteChapter(id);
    }
//添加Chapter
    @Override
    public String addChapter(Chapter chapter) {
        String s = UUID.randomUUID().toString();
        chapter.setId(s);
        dao.insertChapter(chapter);
        return s;
    }
    @Override
    public void updateDownPath(Chapter chapter) {
        dao.updateDownPath(chapter);
    }
}
