<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/19
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/echarts/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        var myChart1 = echarts.init(document.getElementById('main'));
             var goEasy = new GoEasy({
             appkey: 'BC-1921b5a5e7d348bab71eea7e0f2a683a'
         });
        goEasy.subscribe({
             channel:'chart',
             onMessage: function(message){
                 var data = JSON.parse(message.content);
                 console.log(data)
                 var option = {
                     title: {
                         text: '每月注册人数'
                     },
                     tooltip: {},
                     legend: {
                         data:'月份'
                     },
                     xAxis: {
                         data: data[0]
                     },
                     yAxis: {},
                     series: [{
                         name: '月份',
                         type: 'bar',
                         data: data[1]
                     }]
                 };
                 // 使用刚指定的配置项和数据显示图表。
                 myChart1.setOption(option);
             }
       })

       $(function () {
           $.post("${pageContext.request.contextPath}/user/queryNumber",function (result) {
           },"json")
       })
    </script>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>



