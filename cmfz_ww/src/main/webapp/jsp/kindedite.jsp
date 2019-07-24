<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/lang/zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/ajaxfileupload.js"></script>
    <script>
        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id',
                {width : '1000px',
                uploadJson:"${pageContext.request.contextPath}/aticle/upload",
                fileManagerJson:"${pageContext.request.contextPath}/aticle/showAll",
                filePostName:'file'
                }
            );
        });

    </script>
</head>
<body>
        <textarea id="editor_id" name="content" style="width:700px;height:300px;">
             &lt;strong&gt;HTML内容&lt;/strong&gt;
        </textarea>
</body>
</html>
