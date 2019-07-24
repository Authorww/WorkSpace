package com.baizhi.cache;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class StringRedisConfig implements ApplicationContextAware {
    private static ApplicationContext applicationContext;
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
               this.applicationContext = applicationContext;
    }
    //将StringRedisTemplate 交给工厂管理

    public static StringRedisTemplate getStringRedisTemplate(){
//        从工厂中获取
        StringRedisTemplate bean = applicationContext.getBean(StringRedisTemplate.class);
        return bean;
    }

}
