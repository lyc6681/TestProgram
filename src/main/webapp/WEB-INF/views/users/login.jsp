<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 2017/8/19
  Time: 上午10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <style>
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<div class="container col-md-3 col-center-block">
    <div class="container table table-bordered">
        <h4>登录</h4>
        <hr>
        <form action="/login" method="post">
            <div class="form-group">
                <label for="InputUsername">用户名</label>
                <input type="text" class="form-control" name="name"
                       id="InputUsername" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="InputPassword">密码</label>
                <input type="password" class="form-control" name="password"
                       id="InputPassword" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> 自动登录
                    </label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-default">登录</button>
                <button id="btn" class="btn btn-default" type="button">注册</button>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $("#btn").click(function () {
        $.ajax({
            url: "/toRegister"})
    });

</script>
</html>
