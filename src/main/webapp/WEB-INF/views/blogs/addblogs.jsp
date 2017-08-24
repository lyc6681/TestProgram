<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<style>
    .col-center-block {
        float: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<body>
<br>
<br>
<div class="container">
    <form class="form-horizontal" action="/updateBlog" method="post">
        <div class="form-group">
            <label for="inputHeadline" class="col-sm-2">标题</label>
            <div class="col-sm-10">
                <input type="headline" name="title" class="form-control" id="inputHeadline" value="${blog.title}" placeholder="请输入标题">
                <input hidden name="id" value="${blog.id}">
            </div>
        </div>
        <hr>
        <div class="form-group">
            <label for="inputDescribe" class="col-sm-2">描述</label>
            <div class="col-sm-10">
                <input type="describe" name="des" class="form-control" id="inputDescribe" value="${blog.des}" placeholder="请简要描述一下博客内容">
            </div>
        </div>
        <hr>
        <div class="form-group">
            <label for="inputContent" class="col-sm-2">内容</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="20" name="content" id="inputContent" placeholder="请输入内容">${blog.content}</textarea>
            </div>
        </div>

        <div class="container" align="center">
            <div class="col-sm-offset-2 col-sm-8">
                <button type="submit" class="btn btn-primary">提交</button>
                <a class="btn btn-default" href="/toIndex" role="button">返回</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
