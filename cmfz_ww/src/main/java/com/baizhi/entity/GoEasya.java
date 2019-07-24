package com.baizhi.entity;

import com.google.gson.Gson;
import io.goeasy.GoEasy;
import org.junit.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GoEasya {
   @Test
   public static void main(String[] args) {
        GoEasy goEasy = new GoEasy("https://rest-hangzhou.goeasy.io", "BC-1921b5a5e7d348bab71eea7e0f2a683a");
       Map<String , Object> map = new HashMap<>();
       List<Object> sell = new ArrayList<>();
       sell.add(Math.random()*1000);
       sell.add(Math.random()*1000);
       sell.add(Math.random()*1000);
       sell.add(Math.random()*1000);
       sell.add(Math.random()*1000);
       sell.add(Math.random()*1000);
       map.put("sell",sell);
       map.put("produce",sell);
       Gson gson = new Gson();
       String s = gson.toJson(map);
        goEasy.publish("demo_channel", s);
    }
}
