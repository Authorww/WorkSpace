<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/19
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://www.echartsjs.com/gallery/vendors/echarts/map/js/china.js?_v_=1553896255267"></script>
    <script type="text/javascript">
        var myChart2 = echarts.init(document.getElementById('provinceAndGender'));
             var goEasy = new GoEasy({
             appkey: 'BC-1921b5a5e7d348bab71eea7e0f2a683a'
             })
         goEasy.subscribe({
             channel:'map',
             onMessage: function(message) {
                 var data = JSON.parse(message.content);
                 /* var myChart1 = echarts.init(document.getElementById('provinceAndGender'));
                  var myChart2 = echarts.init(document.getElementById('main'));*/
                 option = {
                     title: {
                         text: '注册人数',
                         subtext: '纯属虚构',
                         left: 'center'
                     },
                     tooltip: {
                         trigger: 'item'
                     },
                     legend: {
                         orient: 'vertical',
                         left: 'left',
                         data: ['男', '女']
                     },
                     visualMap: {
                         min: 0,
                         max: 2500,
                         left: 'left',
                         top: 'bottom',
                         text: ['高', '低'],           // 文本，默认为数值文本
                         calculable: true
                     },
                     toolbox: {
                         show: true,
                         orient: 'vertical',
                         left: 'right',
                         top: 'center',
                         feature: {
                             mark: {show: true},
                             dataView: {show: true, readOnly: false},
                             restore: {show: true},
                             saveAsImage: {show: true}
                         }
                     },
                     series: [
                         {
                             name: '男',
                             type: 'map',
                             mapType: 'china',
                             roam: false,
                             label: {
                                 normal: {
                                     show: false
                                 },
                                 emphasis: {
                                     show: true
                                 }
                             },
                             data:
                             data.map1
                             /*{name: '天津',value: Math.round(Math.random()*1000)},*/
                         },
                         {
                             name: '女',
                             type: 'map',
                             mapType: 'china',
                             label: {
                                 normal: {
                                     show: false
                                 },
                                 emphasis: {
                                     show: true
                                 }
                             },
                             data: data.map2
                         }
                     ]
                 };
                 // 使用刚指定的配置项和数据显示图表。
                 myChart2.setOption(option);
             }

       })

       $(function () {
           $.get("${pageContext.request.contextPath}/user/queryProvinceAndGender",function (result) {
           },"json")
       })

    </script>


</head>
<body>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <%--栅格系统调整div 格式--%>
   <%-- <div class="row">
        <div class="col-md-6">
            <div id="provinceAndGender" style="width: 600px;height:400px;"></div>
        </div>
        <div class="col-md-6">
            <div id="main" style="width: 600px;height:400px;"></div>
        </div>
    </div>--%>
    <div id="provinceAndGender" style="width: 600px;height:400px;"></div>


</body>
</html>
