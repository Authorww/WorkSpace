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
    <title>持明法洲轮播图管理</title>

    <script type="text/javascript">
        $(function(){
            $("#tableAbulm").jqGrid({
                styleUI:"Bootstrap",
                url:"${pageContext.request.contextPath}/album/queryAll",
                datatype:"json",
                mtype:"post",
                height:"100%",
                autowidth:true,
                colNames:["编号","专辑名称","专辑封面","章节数量","专辑得分","专辑作者","播音员","专辑简介","出版时间"],
                colModel:[{
                    name:"id"
                },{
                    name:"title",editable:true
                },{
                    name:"cover",editable:true,
                    edittype : 'file',
                    formatter:function (cellvalue,options,rowsObject) {
                        return "<img style='width:50px;height:50px' src='${pageContext.request.contextPath}/imgCover/"+cellvalue+"'/>"
                    }
                },{
                    name:"count",editable:true
                },{
                    name:"score",editable:true
                },{
                    name:"author",editable:true
                },{
                    name:"broadcast",editable:true
                },{
                    name:"brief",editable:true
                },{
                    name:"publishTime",editable:true,edittype:"date"
                }],
                pager:"#pager",
                rowNum:"3",
                rowList:[3,5,6],
                loadonce: true,
                viewrecords:true,
                autowidth:true,
                multiselect:true,
                rownumbers:true,
                editurl:"${pageContext.request.contextPath}/album/edite",
            }).jqGrid("navGrid","#pager",{},{
                //修改
                closeAfterEdit: true,
            },{
                //添加
                closeAfteradd: true,
                afterSubmit:function (response) {
                    //发送ajax
                    $.ajaxFileUpload({
                        url:"${pageContext.request.contextPath}/album/imgUpload",
                        fileElementId: "cover",
                        type:"post",
                        data:{"id":response.responseText},
                        success:function(){
                            $("#tableAbulm").trigger("reloadGrid");
                        }
                    })
                    return "[true]";
                }
            })

        })







    </script>


</head>
<body>
<div class="page-header">
    <h1> 专辑管理</h1>
</div>
    <table id="tableAbulm">

    </table>
    <div id="pager">

    </div>

</body>
</html>