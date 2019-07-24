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
    <title>持明法洲文章管理</title>

    <script type="text/javascript">
           $(function () {
               $("#tableGuru").jqGrid({
                   styleUI:"Bootstrap",
                   url:"${pageContext.request.contextPath}/guru/queryByPage",
                   datatype:"json",
                   mtype:"post",
                   pager:"pagerGuru",
                   rowNum:3,
                   rowList:[2,3,5,6],
                   viewrecords:true,
                   autowidth:true,
                   cellurl:"${pageContext.request.contextPath}/guru/edit",
                   colNames:["编号","性别","姓名","简介","状态","操作"],
                   colModel:[{
                       name:"id"
                   },{
                       name:"sex"
                   },{
                       name:"name"
                   },{
                       name:"profile"
                   },{
                       name:"status"
                   },{
                       name:"id",formatter:function(cellvalue, options, rowObject){
                           return "<a href='#'>文章</a>"
                       }
                   }]
               }).jqGrid("navGrid","#pagerGuru",{})
           })

    </script>
</head>
<body>
<div class="page-header">
    <h1> 上师管理</h1>
</div>

    <table id="tableGuru">

    </table>
    <div id="pagerGuru">

    </div>

</body>
</html>