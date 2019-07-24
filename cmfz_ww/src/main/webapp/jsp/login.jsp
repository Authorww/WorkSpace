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
    <title>持明法洲后台管理系统</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jqgrid/extend/js/jquery.min.js"></script>
    <script type="text/javascript">

        function login() {

            $.get("${pageContext.request.contextPath}/admin/login",$("#loginForm").serialize(),function (data) {
                alert(data)
                alert(data.code)
                if(data.code==200){

                    location.href="${pageContext.request.contextPath}/jsp/main.jsp";
                }else {
                    $("#message").html(data.message)
                }
            },"json")
        }


    </script>

</head>
<body>

<form class="form-horizontal" id="loginForm" action="javascript:void(0)">
    <span id="message" style="color: red"></span>
    <div class="form-group">
        <label class="col-sm-2 control-label">UserName</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="username" placeholder="UserName">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="Password">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-default" id="#saveBtn" onclick="login()">登录</button>
        </div>
    </div>
</form>
    <%--页尾--%>
</body>
</html>