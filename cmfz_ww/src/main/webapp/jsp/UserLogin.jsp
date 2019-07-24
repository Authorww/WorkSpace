<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/21
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
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
    <script type="text/javascript">
          function showon() {
              alert("---------------")
              $('#myModal').modal({
                  keyboard: false,
                  show:true
              })
          }


            function logi() {
                 alert("222222222")
                 $.ajax({
                     url:"${pageContext.request.contextPath}/user/login",
                     type:"post",
                     datatype:"json",
                     data:$("#login").serialize(),
                     success:function(data){
                         if (data.code == '200'){
                             location.href="${pageContext.request.contextPath}/jsp/main.jsp"
                         }else{
                             $("#message").html(data.message)
                         }
                     }
                 })
             }




    </script>





</head>
<body>
    <div class="row">
        <h1> <img src="${pageContext.request.contextPath}/upload/timg.jpg" style="width: 2000px;height:250px"/></h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <form class="form-horizontal" id="Userlogin">
                    <div class="form-group">
                       <h1 class="text-center col-md-offset-6">欢迎登陆持名法州官网</h1>
                        <label for="inputEmail3" class="col-md-offset-5 col-sm-1 control-label">账号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputEmail3">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-md-offset-5 col-sm-1 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="inputPassword3">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-offset-4 col-sm-2 control-label">验证码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-7 col-sm-3 text-center">
                             <button  id="regist" onclick="showon()" class="btn btn-primary">注册</button>
                             <button  id="login" onclick="logi()" class="btn btn-default" >登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>



<%--添加模态框--%>
    <!-- Button trigger modal -->
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">用户注册</h4>
                </div>
                <div class="modal-body">
                   <%--添加注册表单--%>
                       <form class="form-horizontal">
                           <div class="form-group">
                               <label for="inputEmail3" class="col-md-offset-2 col-sm-2 control-label">用户名</label>
                               <div class="col-sm-6">
                                   <input type="text" class="form-control" >
                               </div>
                           </div>
                           <div class="form-group">
                               <label for="inputPassword3" class="col-md-offset-2 col-sm-2 control-label">手机号</label>
                               <div class="col-sm-6">
                                   <input type="password" class="form-control">
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-md-offset-2 col-sm-2 control-label">密码</label>
                               <div class="col-sm-6">
                                   <input type="password" class="form-control">
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-md-offset-2 col-sm-2 control-label">性别</label>
                               <div class="col-sm-6">
                                   <input type="text" class="form-control">
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-md-offset-2 col-sm-2 control-label">头像</label>
                               <div class="col-sm-6">
                                   <input type="file" id="exampleInputFile">
                               </div>
                           </div>

                           <div class="form-group">
                               <label class="col-md-offset-2 col-sm-2 control-label">省份</label>
                               <div class="col-sm-6">
                                   <input type="text" class="form-control">
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-md-offset-2 col-sm-2 control-label">城市</label>
                               <div class="col-sm-6">
                                   <input type="text" class="form-control">
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-md-offset-2 col-sm-2 control-label">个性签名</label>
                               <div class="col-sm-6">
                                   <input type="text" class="form-control">
                               </div>
                           </div>
                       </form>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>



    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Launch demo modal
    </button>





</body>
</html>
