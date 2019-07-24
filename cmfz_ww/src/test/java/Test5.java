import com.baizhi.PSVM;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = PSVM.class)
public class Test5 {
    @Autowired
    UserService service;
    @Autowired
    UserDao dao;
    @Test
    public  void  test1(){
        List<User> users = service.queryAll();
        for (User user : users) {
            System.out.println(user);
        }


    }

}
