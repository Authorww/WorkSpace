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

        $(function() {

              $("#table1").jqGrid({
                    styleUI:"Bootstrap",
                    url: '${pageContext.request.contextPath}/admin/queryCarouse',
                    datatype: 'json',
                    mtype: 'post',
                    autowidth:true,
                    pager: 'pager111',
                    colNames:["编号","轮播图名称","轮播图图片","状态","创建时间"],
                    colModel:[{
                        name:"id"
                    },{
                        name:"title",editable:true
                    },{
                        name:"path",
                        editable : true,
                        edittype : 'file',
                        formatter:function(cellvalue, options, rowObject){
                           return "<img style='width:50px;height:50px' src='${pageContext.request.contextPath}/upload/"+cellvalue+"'/>";
                          }
                    },{
                        name:"status",editable:true
                    },{
                        name:"createTime",editable:true,edittype:"date"
                    }],
                    multiselect : true,
                    rownumbers: true,
                    mtype:"post",
                    loadonce: true,
                    pager:"#pager111",
                    height:450,
                    viewrecords:true,
                    rowNum:5,
                    page:1,
                    rowList:[1,2,5,8],
                    editurl:"${pageContext.request.contextPath}/admin/edite",
                }).jqGrid("navGrid","#pager111",{},{
                    closeAfterEdit: true,
                  afterSubmit:function (response) {
                      $.ajaxFileUpload({
                          url:"${pageContext.request.contextPath}/admin/upload",
                          fileElementId:"path",
                          data:{"id":response.responseText},
                          type:"post",
                          success:function(){
                              $("#table1").trigger("reloadGrid");
                          }
                      })
                      return "[true]";
                  }
                },{
                    closeAfterAdd:true,
                    afterSubmit:function (response) {
                        $.ajaxFileUpload({
                            url:"${pageContext.request.contextPath}/admin/upload",
                            fileElementId:"path",
                            data:{"id":response.responseText},
                            type:"post",
                            success:function(){
                                $("#table1").trigger("reloadGrid");
                            }
                        })
                        return "[true]";
                    }
              })
        })

    </script>




</head>
<body>
    <table id="table1">

    </table>
    <div id="pager111">

    </div>

</body>
</html>