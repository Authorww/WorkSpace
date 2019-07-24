import com.baizhi.PSVM;
import com.baizhi.dao.GuruDao;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.*;

import com.baizhi.service.GuruService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import org.springframework.test.context.junit4.SpringRunner;


import java.util.List;
import java.util.Map;

@SpringBootTest(classes = PSVM.class)
@RunWith(SpringRunner.class)
public class Tset1 {
   @Autowired
   GuruService service;
   @Autowired
    GuruDao dao;
   @Autowired
    UserDao userDao;

    @Test
    public void test(){

        System.out.println("=====");

//       Admin xiaohuahua = service.queryOne("xiaohuahua", "123456");
  /*      Map<String, Object> map = service.queryAdminByName(new Admin("null", "xiaohuaa", "123456"));
        System.out.println(map);*/
     /*   List<Carouse> carouses = service.queryAllCarouse();
        System.out.println(carouses);*/
    // service.modify(new Carouse("88","99","99","88",new Date()));
  /*      CarousePageDto carousePageDto = service.queryByPage(2, 3);
        System.out.println(carousePageDto);*/
      /*  Carouse carouse = new Carouse();
        carouse.setPath("D:\\������Ŀ\\WorkSpace\\cmfz_ww\\src\\main\\webapp\\upload");
        carouse.setId("te7b34091-f2c1-4175-8a8e-e1ec0d98130f");
        service.modifyImgPath(carouse);*/
      /*  List<Album> albums = service.queryAll();
        System.out.println(albums);*/

/*        Album album = new Album();
        album.setAuthor("3");
        album.setBrief("2");
        album.setBroadcast("2");
        album.setTitle("2");
        album.setCover("2");
        album.setCount(2);
        album.setScore(2);
        album.setPublishTime(new Date());
        String add = service.add(album);
        System.out.println("22222222");
        System.out.println(album);
        System.out.println(add);*/
       /* Article article = new Article();
        article.setContent("3");
        article.setTitle("3");
        article.setPublishTime(new Date());*/
       /* Map<String, Object> stringObjectMap = service.queryAll(1, 3);
        System.out.println(stringObjectMap);*/
/*
        article.setGuruId("wqqwwqw");
        article.setId("dc886a76-6b48-4362-b6b0-014869ea631d");
        System.out.println(article);
        service.modify(article);*/
      /*  Map<String, Object> stringObjectMap = service.queryAll(1, 3);
        List<Guru> gurus = dao.selectAll(1, 3);
        System.out.println(gurus);
        System.out.println(stringObjectMap);*/
        List<User> users = userDao.selectAll();
        System.out.println(users);
    }
}
