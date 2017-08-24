<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 2017/8/15
  Time: 上午9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>

   <div class="container">
       <div class="input-group">
           <input id="content" type="text" class="form-control" placeholder="请输入留言...">
           <span class="input-group-btn">
           <button id="btn" class="btn btn-default" type="button">发布</button>
           </span>
       </div>
       <table id="tab" class="table table-hover">
       </table>
   </div>
   <nav aria-label="Page navigation">
       <ul class="pagination">
           <li>
               <a href="#" aria-label="Previous">
                   <span aria-hidden="true">&laquo;</span>
               </a>
           </li>
           <li><a href="#">1</a></li>
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

</body>
<script>
    //给按钮添加一个点击方法,获取输入框中的内容
    $("#btn").click(function () {
        $.ajax({
            //请求的地址
            url:"/addNew",
            //请求的方式(method)
            type:"get",
            //请求附带的参数列表
            data:{
                content:$("#content").val()
            },
            //请求成功的回调方法:最终处理数据的方法
            success:function (result) {
                //result:请求回来的数据
                console.log(result)
//                addNewTR(0,result.content,0,0,0)
                window.location.reload()
            }
        })
    })

    function addNewTR(id, content, upCount, downCount, how ,user) {

        var tdleft = $("<td></td>").html("<p>"+content+"</p>")
        var tdright = $("<td></td>")
        var userid = user.id;
        //父标签.append(子标签)
        tdright.append("顶:")
        //子标签.appendTo(父标签)
        $("<a href='#'></a>").html(upCount).appendTo(tdright).attr("num",id).click(upfunc)
        tdright.append("踩:")
        $("<a href='#'></a>").html(downCount).appendTo(tdright).attr("num",id).click(downfunc);

        ${account.id}==userid?$("<a href='#'>删除</a>").appendTo(tdright).attr("num",id).click(delfunc):tdright.append("By:").append(user.name)

        //将左右两个td添加到tr中
        //<tr id="ss3"></tr>
        var trOb = $("<tr></tr>").append(tdleft).append(tdright).attr("id","ss"+id)
        //将生成的tr最终添加到写好的table中
        $("#tab").append(trOb)
    }
    //新需求:显示历史消息
    //要求:每次加载完页面,要显示所有的历史消息
    
    function getAllMessage() {
        // 从服务器请求数据到前端页面
        $.ajax({
            url:"/getAll",
            success:function (result) {
                for(var i = 0; i < result.length;i++){
                    //遍历返回的数据,依次在table中添加一行
                    var msg = result[i]
                    addNewTR(msg.id,msg.content,msg.up,msg.down,0,msg.user)
                }
            }
        })
    }
    // 页面加载完毕,去请求所有的消息数据
    getAllMessage()

    var delfunc = function () {
        var aid = $(this).attr("num");
        $.ajax({
            url:"/delete",
            type:"get",
            data:{
                mid:aid
            }
        })
        window.location.reload(true)
    }

    var upfunc = function () {
        var aid = $(this).attr("num");
        $.ajax({
            url:"/upUpdate",
            type:"get",
            data:{
                mid:aid
            }
        })
        window.location.reload(true)
    }
    var downfunc = function () {
        var aid = $(this).attr("num");
        $.ajax({
            url:"/downUpdate",
            type:"get",
            data:{
                mid:aid
            }
        })
        window.location.reload(true)
    }




</script>
</html>
