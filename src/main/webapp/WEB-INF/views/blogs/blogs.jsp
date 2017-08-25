<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>查看博客页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <h3>${blog.title}</h3>
    <hr>
    <p>${blog.des}</p><br/>
    <p>${blog.content}</p>
</div>
</body>
</html>
