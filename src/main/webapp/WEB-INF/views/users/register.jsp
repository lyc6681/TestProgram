<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<html>
<head>
    <title>注册页面</title>
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
<div class="container col-md-4 col-center-block">
    <div class="container table table-bordered">
        <h4>注册</h4><hr>
        <form action="/register" method="post">
            <label for="InputUsername">用户名</label>
            <input type="username" class="form-control" name="name"
                   id="InputUsername" placeholder="请输入用户名">
            <br>
            <label for="InputPassword">密码</label>
            <input type="password" class="form-control" name="password"
                   id="InputPassword" placeholder="请输入密码">
            <br>
            <label for="InputRepetition">重复密码</label>
            <input type="repetition" class="form-control" name="repetition"
                   id="InputRepetition" placeholder="请再次输入密码">
            <br>
            <label for="InputTelephone">电话</label>
            <input type="telephone" class="form-control" name="telephone"
                   id="InputTelephone" placeholder="请输入常用电话">
            <br>
            <label for="InputAddress">地址</label>
            <input type="address" class="form-control" name="address"
                   id="InputAddress" placeholder="请输入常用地址">
            <br>
            <button type="submit" class="btn btn-default">提交注册</button>
        </form>
    </div>
</div>

</body>
</html>
