package com.baizhi.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.concurrent.locks.ReadWriteLock;

public class MyCache implements Cache {
//    这是namespace
    private String id;
    public MyCache (String id){
        System.out.println(id+"这是MyCache的id");
        this.id = id;
    }
    @Override
    public String getId() {
        return this.id;
    }
    @Override
    public void putObject(Object key, Object value) {
        System.out.println("不能到缓存中取值");
        System.out.println("将查询到的值存入缓存中");
        String serialize = SerializeUtils.serialize(value);
        System.out.println("将查询出的数据全部存入缓存中");
       StringRedisConfig.getStringRedisTemplate().opsForHash().put(id, key.toString(), serialize);

    }

    @Override
    public Object getObject(Object key) {
        System.out.println("到缓存中取值");
        StringRedisTemplate stringRedisTemplate = StringRedisConfig.getStringRedisTemplate();
       String str = (String)stringRedisTemplate.opsForHash().get(id, key.toString());
//       将获取的字符串转换为Object
        if (str!=null){
            Object o = SerializeUtils.serializeToObject(str);
            return o;
        }
        return null;

    }

    @Override
    public Object removeObject(Object o) {
        System.out.println("取消缓存");

        return null;
    }

    @Override
    public void clear() {
//      如果是修改操作则进行删除缓存
        System.out.println("删除缓存");
        StringRedisTemplate stringRedisTemplate = StringRedisConfig.getStringRedisTemplate();
        stringRedisTemplate.delete(id);
    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return null;
    }
}
