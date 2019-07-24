<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/11
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<%--添加版面--%>
    <%--第一行--%>

<div id="carousel-example-generic">
<div class="jumbotron">
    <h2>欢迎来到持名法州后台管理系统 </h2>
</div>
<%--轮播图--%>
<div id="xxx" class="carousel slide" data-ride="carousel">
    <!-- 指示器 -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>
    <!-- 轮播图片及说明文字 -->
    <div class="carousel-inner " role="listbox">
        <div class="item active center-block">
            <p class="center-block">
            <a href="#" class="pc_imgBox "><img class="center-block" src="${pageContext.request.contextPath}/img/1.png" alt=""></a>
            </p>
        </div>
        <div class="item">
            <a href="#" class="m_imgBox"><img class="center-block" src="${pageContext.request.contextPath}/img/2.png" alt=""></a>
        </div>
        <div class="item">
            <a href="#" class="m_imgBox"><img class="center-block" src="${pageContext.request.contextPath}/img/3.png" alt=""></a>
        </div>
        <div class="item">
            <a href="#" class="m_imgBox"><img class="center-block" src="${pageContext.request.contextPath}/img/4.png" alt=""></a>
        </div>
    </div>
    <!-- 控制按钮：左右切换 -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
</div>
</body>
</html>
