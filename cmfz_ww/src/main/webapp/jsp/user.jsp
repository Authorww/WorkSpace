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

    <script src="${pageContext.request.contextPath}/echarts/echarts.js"></script>

    <title>用户管理系统</title>
    <script type="text/javascript">
         $(function () {
             $("#userTable").jqGrid({
                 styleUI:"Bootstrap",
                 url:"${pageContext.request.contextPath}/user/queryAll",
                 datatype:"json",
                 mtype:"post",
                 pager:"userpager",
                 rowNum:3,
                 rowList:[2,3,5,8],
                 viewrecords:true,
                 autowidth:true,
                 loadonce: true,
                 height:"100%",
                 viewrecords:true,
                 autowidth:true,
                 reloadAfterSubmit:true,
                 editurl:"${pageContext.request.contextPath}/user/edit",
                 multiselect:true,
                 colNames:["编号","电话","密码","盐","用户名","省份","城市","性别","个人签名","头像","状态","注册时间"/*,"修改状态"*/],
                 colModel:[{
                     name:"id"
                 },{
                     name:"phone",editable:true
                 },{
                     name:"password",editable:true
                 },{
                     name:"salt",editable:true
                 },{
                     name:"dharmaName",editable:true
                 },{
                     name:"province",editable:true
                 },{
                     name:"city",editable:true
                 },{
                     name:"gender",editable:true
                 },{
                     name:"personalSign",editable:true
                 },{
                     name:"profile",edittype:"file",editable:true,
                     formatter:function(cellvalue, options, rowObject){
                         return"<img style='width:50px;height:50px' src='${pageContext.request.contextPath}/userImg/"+cellvalue+"'>"
                     }
                 },{
                     name:"status",editable:true,edittype:"select",editoptions:{value: {"1":"正常", "2":'冻结'}},
                    /* formatter:function(cellvalue, options, rowObject){
                         return "<select id='status' onchange='changeStatus(\""+rowObject.id+"\")'><option value=‘1’>正常</option><option value=‘2’>冻结</option></select>"
                     }*/
                 },{
                     name:"registTime",edittype:"date",editable:true
                 }/*,{
                     name:"id",editable:true,edittype:"date",
                    formatter:function(cellvalue, options, rowObject){
                         return "<button id='status' onclick='changeStatus(\""+rowObject.id+"\")'>修改状态</button>"
                     }
                 }*/]
             }).jqGrid("navGrid","#userpager",{},{
                 closeAfterEdit: true,
                 afterSubmit:function (response) {
                     $("#userTable").trigger("reloadGrid");
                     //发送ajax
                     $.ajaxFileUpload({
                         url:"${pageContext.request.contextPath}/user/upload",
                         fileElementId: "profile",
                         type:"post",
                         data:{"id":response.responseText},
                         success:function(){
                             $("#userTable").trigger("reloadGrid");
                         }
                     })
                     return "[true]"
                 }
             },{
                 closeAfteradd: true,
                 afterSubmit:function (response) {
                     //发送ajax
                     $.ajaxFileUpload({
                         url:"${pageContext.request.contextPath}/user/upload",
                         fileElementId: "profile",
                         type:"post",
                         data:{"id":response.responseText},
                         success:function(){
                             $("#userTable").trigger("reloadGrid");
                         }
                     })
                     return "[true]"
                     $("#userTable").trigger("reloadGrid");
                 }
             })
         })
  /*    function changeStatus(id){
             $.post("/user/changeStatus",{id:id},function () {

             },"json")
         }*/
         //
       /* $(function () {
            alert("3333")
           // $("#main_id").append('<option value='+data[i].id+'>'+data[i].class_name+'</option>');
            alert($("#status").val())
            alert("4444")
           $.post("/user/changeStatus",function () {
               //$("#status").append(("<option value='1'>正常</option>"))
               $("#status").append(("<option></option>").text("冻结").val("2"))
            },"json")
        })*/
         /*  $(function () {
             var myChart = echarts.init(document.getElementById('main'));
              /!*go Easy*!/
              var goEasy = new GoEasy({
                  appkey: 'BC-1921b5a5e7d348bab71eea7e0f2a683a'
              });
              goEasy.subscribe({
                  channel:'demo_channel',
                  onMessage: function(message){
                      alert('收到：'+message.content);
                  }
              });*/


         /*  $.post("/user/queryNumber",function (result) {
               var count = result.count;
               var month = result.month;
               // 指定图表的配置项和数据
               var option = {
                   title: {
                       text: '每月注册人数'
                   },
                   tooltip: {},
                   legend: {
                       data:'月份'
                   },
                   xAxis: {
                       data: month
                   },
                   yAxis: {},
                   series: [{
                       name: '月份',
                       type: 'bar',
                       data: count
                   }]
               };

               // 使用刚指定的配置项和数据显示图表。
               myChart.setOption(option);
           },"json")
       })
*/
       $(function () {
           $.post("${pageContext.request.contextPath}/user/queryAll",function (data) {
           },"json")
       })

    </script>

</head>
<body>

    <form action="${pageContext.request.contextPath}/user/importFile" method="post" enctype="multipart/form-data" id="fileFrom">
        <input type="file" name="file" >
        <%--<input type="button" class="btn btn-primary" id="btnimport" onclick="importFile()" value="一键导入">--%>
        <input type="submit">
    </form>

    <a class="btn btn-primary" id="btn" href="${pageContext.request.contextPath}/user/export">一键导出</a>
    <table id="userTable"></table>
    <div id="userpager"></div>


</body>
</html>