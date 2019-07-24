import com.baizhi.PSVM;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.CountMonth;
import com.baizhi.entity.User;
import com.baizhi.entity.UserDto;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@SpringBootTest(classes = PSVM.class)
@RunWith(value = SpringRunner.class)
public class Test4 {
    @Autowired
    UserService service;
    @Autowired
    UserDao userDao;
    @Test
    public void test3(){
        User user = new User();
        user.setPhone("123225");
        user.setDharmaName("任达华");
        user.setDharmaName("dashi");
        user.setProvince("香港");
        user.setCity("香港");
        user.setPersonalSign("微笑对待");
        user.setGender("男");
        user.setStatus("正常");
        service.add(user);
    }
    @Test
    public void test(){
//        Integer integer = userDao.queryByMonth();
//        List<CountMonth> countMonths = service.queryBymonth();
//        System.out.println(countMonths);
        Map<String, Object> map = service.queryByProvince();
//        System.out.println(map.get("sex"));
        System.out.println(map.get("gender"));
        System.out.println(map.get("map1"));
//        System.out.println(map.get("map2"));
//        System.out.println(map);
    }
}
