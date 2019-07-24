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
    <%--editer--%>
    <script src="${pageContext.request.contextPath}/jqgrid/extend/js/trirand/jquery.jqGrid.min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/lang/zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/ajaxfileupload.js"></script>
    <title>持明法洲文章管理</title>

    <script type="text/javascript">

        $(function () {
            KindEditor.create('#editor_id',
                    {width : '700px',
                        uploadJson:"${pageContext.request.contextPath}/article/upload",
                        fileManagerJson:"${pageContext.request.contextPath}/article/showAll",
                        filePostName:'file',
                        allowFileManager:true,
                        afterBlur:function(){
                            this.sync();
                        }
                    }
                );
        })

           $(function () {
               $("#tableAticle").jqGrid({
                   styleUI:"Bootstrap",
                   url:"${pageContext.request.contextPath}/article/queryAll",
                   datatype:"json",
                   mtype:"post",
                   autowidth:true,
                   height : '100%',
                   pager:"pagerAticle",
                   viewrecords: true,
                   rowNum: 3,
                   rowList:[3,5,6,8,10],
                   editurl:"${pageContext.request.contextPath}/article/edit",
                   multiselect:true,
                   rownumbers:true,
                   colNames: ["编号","大师编号","标题","内容","出版日期","操作"],
                   colModel : [{
                       name:"id"
                   },{
                       name:"guruId",editable:true,edittype:"select",editoptions: {value:getOptionValue()}
                   },{
                       name:"title",editable:true
                   },{
                       name:"content",editable:true,edittype:"textarea"
                   },{
                       name:"publishTime",editable:true,edittype:"date"
                   },{
                      name:"id",formatter:function (cellvalue,options,rowObject) {
                         /*  return "<button class='btn btn-primary'  onclick='queryDe(\""+rowObject.id+"\")'>文章预览</button>"*/
                           return   "<button class='btn btn-primary'  onclick='queryDe(\""+rowObject.id+"\")'> 文章预览 </button>"
                       }
                   }
                   ],
               }).jqGrid("navGrid","#pagerAticle",{},{
               },{
                   //添加
                   closeAfteradd: true
               })

               function getOptionValue() {
                   var options = "";
                   var i = 0;
                   $.ajax({
                       async: false,  //千万要记住加这个属性配置
                       type: "post",
                       url: "${pageContext.request.contextPath}/guru/queryAll",
                       success: function (data) {
                           for (i; i < data.length; i++) {
                               if (i != data.length - 1) {
                                   options += data[i].id + ":" + data[i].name + ";";
                               } else {
                                   options += data[i].id + ":" + data[i].name;
                               }
                           }
                       }
                   });
                   return options;
               }
           })
           //发送Ajax 查询所有上师
        function upload() {
            $('#myModal').modal({
                keyboard: false,
                show:true
            })
            $.post("${pageContext.request.contextPath}/guru/queryAll",function (arr) {
                for (var i=0;i<arr.length;i++){
                    $("#queryAllMaster").append($("<option></option>").text(arr[i].name).val(arr[i].id));
                }
            },"json");
        }
        //       添加文章,向后台发请求
        function addArticle() {
            $.post("${pageContext.request.contextPath}/article/add",
                $("#ArticleForm").serialize(),
                function () {
                }, "json")
        }
        //查询文章预览
        function queryDe(id){
            console.log("4545455")
            console.log(id)
            alert(id)
            $.post("${pageContext.request.contextPath}/article/queryOneById",{id:id},function () {
                $('#myModal').modal({
                    keyboard: false,
                    show:true
                })
                },"json")
        }


    </script>
</head>
<body>
<div class="page-header">
    <h1> 文章管理</h1>
</div>
<%--上师下拉菜单--%>
<%--添加模态框--%>
<button class="btn btn-primary" id="upload" onclick="upload()">
    文件上传
</button>

<%--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="upload" onclick="upload()">
    文件上传
</button>--%>

<!-- Large modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 800px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
          <%--在模态框体内添加表单--%>
        <form class="form-horizontal" id="ArticleForm">
            <div class="modal-body">
                <input type="text" class="form-control" name="title" placeholder="添加标题">
                <%--下拉框查询所有上师--%>
                <select id="queryAllMaster" class="form-control" name="guruId">

                </select>

                <textarea id="editor_id" name="content" style="width:700px;height:300px;">
                     &lt;strong&gt;HTML内容&lt;/strong&gt;
                </textarea>
            </div>
            <%--添加日期--%>
            <div class="modal-body">
                <input type="date"  class="form-control" name="publishTime" placeholder="出版日期">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="addArticle()">Save changes</button>
            </div>
        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <table id="tableAticle">

    </table>
    <div id="pagerAticle">

    </div>

<%--动态模态框--%>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
              <%--添加标题--%>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <%--添加文本--%>
            <div class="modal-body">
                <p  id="modal_text"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>



</body>
</html>