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
                    name:"title",editable:true,align : "center"
                },{
                    name:"cover",editable:true,align : "center",
                    edittype : 'file',
                    formatter:function (cellvalue,options,rowsObject) {
                        return "<img style='width:50px;height:50px' src='${pageContext.request.contextPath}/imgCover/"+cellvalue+"'/>"
                    }
                },{
                    name:"count",editable:true,align : "center"
                },{
                    name:"score",editable:true,align : "center"
                },{
                    name:"author",editable:true,align : "center"
                },{
                    name:"broadcast",editable:true,align : "center"
                },{
                    name:"brief",editable:true,align : "center"
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
                editurl:"${pageContext.request.contextPath}/album/edite",
                rownumbers:true,
                subGrid : true,
                caption : "Grid as Subgrid",
                subGridRowExpanded : function(subgrid_id, row_id) {
                    // we pass two parameters
                    // subgrid_id is a id of the div tag created whitin a table data
                    // the id of this elemenet is a combination of the "sg_" + id of the row
                    // the row_id is the id of the row
                    // If we wan to pass additinal parameters to the url we can use
                    // a method getRowData(row_id) - which returns associative array in type name-value
                    // here we can easy construct the flowing
                    var subgrid_table_id, pager_id;
                    subgrid_table_id = subgrid_id + "_t";
                    pager_id = "p_" + subgrid_table_id;
                    $("#" + subgrid_id).html(
                        "<table id='" + subgrid_table_id
                        + "' class='scroll'></table><div id='"
                        + pager_id + "' class='scroll'></div>");
                    jQuery("#" + subgrid_table_id).jqGrid(
                        {
                           url : "${pageContext.request.contextPath}/album/queryAllChapter?"+"id="+ row_id,
                            styleUI:"Bootstrap",
                            datatype : "json",
                            loadonce: true,
                            autowidth:true,
                            multiselect:true,
                            viewrecords:true,
                            editurl:"${pageContext.request.contextPath}/album/editeChapter?"+"rowId="+ row_id,
                            colNames : [ '编号', '专辑编号', '音频名称', '音频大小(字节)','音频路径','上传时间','操作' ],
                            colModel : [
                                {name : "id",index : "unit",width : 150,key : true},
                                {name : "albumId",index : "unit",width : 150,align : "center"},
                                {name : "title",align : "center",editable:true},
                                {name : "size",align : "center"},
                                {name : "downPath",align : "center",sortable : false,editable:true,edittype:"file"},
                                {name : "uploadTime",align : "center",editable:true,edittype:"date"},
                                {name: "downPath",align : "center",formatter:function(cellvalue, options, rowObject){
                                      return "<a class='btn btn-primary' href='${pageContext.request.contextPath}/album/downLoad?downPath="+cellvalue+"'>下载</a>"
                    } }
                            ],
                            rowNum : 5,
                            rowList:[3,5,6],
                            pager : pager_id,
                            sortname : 'num',
                            sortorder : "asc",
                            height : '100%'
                        });
                    jQuery("#" + subgrid_table_id).jqGrid('navGrid',
                        "#" + pager_id, {
                           edit : false,
                            add : true,
                            del : true
                        },{

                        },{
                        //添加
                            closeAfterAdd:true,
                            afterSubmit:function (response) {
                                //发送ajax
                                $.ajaxFileUpload({
                                    url:"${pageContext.request.contextPath}/album/chapterUpload",
                                    fileElementId: "downPath",
                                    type:"post",
                                    data:{"id":response.responseText},
                                    success:function(){
                                        $("#" + subgrid_table_id).trigger("reloadGrid");
                                    }
                                })
                                $("#" + subgrid_table_id).trigger("reloadGrid");
                                return "[true]"
                            }
                        });
                },

            }).jqGrid("navGrid","#pager",{},{
                //修改
                closeAfterEdit: true,
            },{
                //添加
                closeAfterAdd: true,
                afterSubmit:function (response) {
                    $.ajaxFileUpload({
                        url:"${pageContext.request.contextPath}/album/imgUpload",
                        fileElementId:"cover",
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