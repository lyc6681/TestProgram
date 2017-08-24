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

<%--导航条--%>
<body>
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
                <li><a href="/toAddBlog">新建博客</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" id="searchInfo" class="form-control" placeholder="输入搜索的内容">
                </div>
                <button id="Sbtn" type="button" class="btn btn-default">提交</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">${account.name}</a></li>
                <li><a href="/checkout">切换用户</a></li>
            </ul>
        </div>
    </div>
</nav>

<%--表格--%>

<div class="container">
    <table id="tab" class="table table-bordered">
        <tr>
            <th><strong>博客标题</strong></th>
            <th><strong>博客描述</strong></th>
            <th><strong>操作</strong></th>
        </tr>

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
    function addNewTR(id,title, des, content) {

        var tdleft = $("<td></td>")
        $("<a href='/showInfo?mid="+ id +"'></a>").html(title).appendTo(tdleft).attr("num",id).click(showInfo)
        var tdmid = $("<td></td>").html("<p>"+des+"</p>")
        var tdright = $("<td></td>")
        $("<a href='#'>删除</a>").appendTo(tdright).attr("num",id).click(delfunc)
        tdright.append("    ")
        $("<a href='/toUpdateBlog?mid="+ id +"'>修改</a>").appendTo(tdright).attr("num",id)
        var trOb = $("<tr class='binfo'></tr>").append(tdleft).append(tdmid).append(tdright).attr("id","ss"+id)
        $("#tab").append(trOb)
    }

    function getAllMessage() {
        $.ajax({
            url:"/shwoBlogs",
            success:function (result) {
                for(var i = 0; i < result.length;i++){
                    //遍历返回的数据,依次在table中添加一行
                    var msg = result[i]
                    addNewTR(msg.id,msg.title,msg.des,msg.content)
                }
            }
        })
    }
    $("#Sbtn").click(function () {
        $.ajax({
            url:"/search",
            type:"get",
            data:{
                searchInfo:$("#searchInfo").val()
            },
            success:function (result) {
                $(".binfo").remove();
                for(var i = 0; i < result.length;i++){
                    var msg = result[i]
                    addNewTR(msg.id,msg.title,msg.des,msg.content)
                }
            }
        })
    })
    var delfunc = function () {
        var aid = $(this).attr("num");
        $.ajax({
            url:"/deleteBlog",
            type:"get",
            data:{
                mid:aid
            }
        })
        window.location.reload(true)
    }

    var showInfo = function () {
        var aid = $(this).attr("num");
        $.ajax({
            url:"/showInfo",
            type:"get",
            data:{
                mid:aid
            }
        })
    }



    getAllMessage()
</script>

</html>
