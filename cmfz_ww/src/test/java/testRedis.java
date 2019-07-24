import com.baizhi.PSVM;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = PSVM.class)
public class testRedis {
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Test
    public void test(){
        stringRedisTemplate.opsForValue().set("name", "zhangsan");
    }
}
