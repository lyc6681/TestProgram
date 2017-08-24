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
    <title>博客分页展示</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>
<%--导航条--%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">博客</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="toAddBlogs">新建博客</a></li>
            </ul>
            <form class="navbar-form navbar-left" method="post" action="/search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入搜索的内容">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">${account.name}</a></li>
                <li><a href="/login">切换用户</a></li>
            </ul>
        </div>
    </div>
</nav>

<%--表格--%>

<div class="container">
    <table id="tab" class="table table-bordered">
        <thead>
        <tr>
            <th><strong>博客标题</strong></th>
            <th><strong>博客描述</strong></th>
            <th><strong>操作</strong></th>
        </tr>
        </thead>
        <tbody id="tbody">

        </tbody>
    </table>
</div>

<div class="container" align="center">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
</body>
<script>
    function addBolg(id, title, des) {
        var tdLeft = $("<td></td>");
        var tdMid = $("<td></td>").html("<p>" + des + "</p>");
        var tdRight = $("<td></td>");
        $("<a href='#'>" + title + "</a>").appendTo(tdLeft).attr("showId", id).click(check);
        $("<a href='#'>删除</a>").appendTo(tdRight).attr("delId", id).click(del);
        var tr = $("<tr></tr>").append(tdLeft).append(tdMid).append(tdRight).attr("id", "tr" + id);

        $("#tbody").append(tr);
    }

    var check = function () {
        var tid = $(this).attr("showId");
        $.ajax({
            url: "/",
            data: {tid: tid},
            success: function (result) {
                window.location.href = "/blogs?title=" + result.title + "&content=" + result.content;
            }
        })
    };

    function showBlogs() {
        //从服务器请求数据到前端页面
        $.ajax({
            url: "/shwoBlogs",
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    //遍历返回的数据,一次在table中添加一行
                    var msg = result[i];
                    addBolg(msg.id, msg.title, msg.des)
                }
            }
        })
    }
    showBlogs();

    var del = function () {
        // 拿到a标签的id值
        var blogId = $(this).attr("delId");
        // 将要删除的id发送给后台处理
        $.ajax({
            url: "/deleteBlog",
            data: {
                id: blogId
            },
            success: function () {
                window.location.reload();
            }
        })
    }
</script>
</html>
