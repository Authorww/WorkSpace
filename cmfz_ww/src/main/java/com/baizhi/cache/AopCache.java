package com.baizhi.cache;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Configuration
@Aspect
public class AopCache {
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Around("execution(* com.baizhi.service.*.query*(..))")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        //获取方法名
//        com.baizhi.service.UserServiceImpl@27976390这是target
//        List com.baizhi.service.UserServiceImpl.queryAll()这是signature
//        org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint
        //获取id  key 方法名(如果含有方法重载，则必须加上参数)  value 值
//        获取id
        String id = proceedingJoinPoint.getTarget().getClass().getName();
//        获取方法名,且包括方法重载
        Signature method = proceedingJoinPoint.getSignature();
        Object[] args = proceedingJoinPoint.getArgs();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(method);
        for (Object arg : args) {
             stringBuilder.append(arg);
        }
//        将stringBuilder 转换为字符串
        String s = stringBuilder.toString();
        String value = (String)stringRedisTemplate.opsForHash().get(id, s);
//        将字符串作为小key
//      判断s是不是为空，则需要去数据库查询，放行，并将查询结果存入缓存
         if(value==null){
             System.out.println("缓存中到数据库查询");
             Object proceed = proceedingJoinPoint.proceed();
             String serialize = SerializeUtils.serialize(proceed);
             stringRedisTemplate.opsForHash().put(id, s, serialize);
             return proceed;
         }else{
//             如果直接从缓存中获取数据，则将value 转换为object 返回
             System.out.println("缓存中没有到数据库查询");
             Object o = SerializeUtils.serializeToObject(value);
             return o;
         }
    }
    @After("execution(* com.baizhi.service.*.*(..))&& !execution(* com.baizhi.service.*.query*(..))")
    public void aopAfter(JoinPoint joinPoint){
//         修改
//        获取namespace 大key
        String id = joinPoint.getTarget().getClass().getName();
        System.out.println(joinPoint.getTarget()+"target");
        System.out.println(id+"id");
        stringRedisTemplate.delete(id);
        System.out.println("清空缓存");
    }
}
