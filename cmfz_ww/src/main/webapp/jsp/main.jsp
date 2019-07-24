<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!doctype html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jqgrid/extend/css/trirand/ui.jqgrid-bootstrap.css">
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.3.3.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script src="${pageContext.request.contextPath}/jqgrid/extend/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/ajaxfileupload.js"></script>
    <script src="${pageContext.request.contextPath}/echarts/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/goeasy.js"></script>
    <title>持明法洲后台管理系统</title>

</head>
<body>

<%--标题导航栏--%>
<%--导航条--%>
<jsp:include page="/top.jsp"></jsp:include>

<div class="container-fluid">
    <%--第一行--%>
    <div class="row">
        <div class="col-md-2 ">
              <%--手风琴--%>
                  <jsp:include page="/left.jsp"></jsp:include>
        </div>
        <div class="col-md-10">
             <%--主题页面--%>
            <jsp:include page="/right.jsp"></jsp:include>
        </div>
    </div>
    <%--第二行--%>
    <div class="footrow">
        <div class="panel panel-default text-center">
            <div class="panel-footer navbar-fixed-bottom">@百知教育baizhi@zpark@163.com</div>
        </div>
    </div>
</div>
    <%--页面主体--%>
    <%--页尾--%>
</body>
</html>