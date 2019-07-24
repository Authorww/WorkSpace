<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!doctype html>

<html lang="en">
<head>

</head>
<body>



<%--页面主体--%>
<%--布局 --%>
<%--手风琴--%>
<div class="panel-group" id="panelgroup1">
    <%--员工管理--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title" data-toggle="collapse" data-target="#collapse1" data-parent="#panelgroup1">
                <a href="#">轮播图</a>
            </h4>
        </div>
        <div id="collapse1" class="panel-collapse collapse">
           <div class="panel-body">
                <a href="javascript:$('#carousel-example-generic').load('${pageContext.request.contextPath}/jsp/show1.jsp');" id="emsListBtn">轮播图管理</a><br/>
            </div>
        </div>
    </div>

    <%--专辑--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title" data-toggle="collapse" data-target="#collapse2" data-parent="#panelgroup1">
                <a href="#">专辑</a>
            </h4>
        </div>
        <div id="collapse2" class="panel-collapse collapse">
            <div class="panel-body">
                <a href="javascript:$('#carousel-example-generic').load('${pageContext.request.contextPath}/jsp/album1.jsp');">专辑和章节管理</a><br/>
            </div>
        </div>
    </div>
    <%--文章--%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" data-toggle="collapse" data-target="#collapse3" data-parent="#panelgroup1">
                    <a href="#">文章</a>
                </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
                <div class="panel-body">
                    <a href="javascript:$('#carousel-example-generic').load('${pageContext.request.contextPath}/jsp/article.jsp');">文章管理</a><br/>
                </div>
            </div>
        </div>
    <%--用户--%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" data-toggle="collapse" data-target="#collapse4" data-parent="#panelgroup1">
                    <a href="#">用户</a>
                </h4>
            </div>
            <%--用户管理--%>
            <div id="collapse4" class="panel-collapse collapse">
                <div class="panel-body">
                    <a href="javascript:$('#carousel-example-generic').load('${pageContext.request.contextPath}/jsp/user.jsp');">用户管理</a><br/>
                </div>
                <%--用户管理--%>
                <div class="panel-body">
                    <a href="javascript:$('#carousel-example-generic').load('${pageContext.request.contextPath}/jsp/echarts.jsp');">用户柱状统计统计</a><br/>
                </div>
                <div class="panel-body">
                    <a href="javascript:$('#carousel-example-generic').load('${pageContext.request.contextPath}/jsp/echarts1.jsp');">用户地图统计</a><br/>
                </div>
            </div>

        </div>
</div>


    <%--页尾--%>
</body>
</html>