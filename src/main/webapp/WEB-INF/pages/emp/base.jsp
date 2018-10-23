<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/10 0010
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body{
            background-image: url(/images/1.jpg);
        }
    </style>

    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap-table-master/dist/bootstrap-table.min.css">

    <script src="/js/jquery-1.10.2.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>

    <script src="/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <script src="/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <script>
        $(function () {
            $("#up").click(function () {
                var name = $("#name").text();
                var url = "/emp/up";
                var args = {"name":name};
                $.post(url,args,function (data) {
                    if (data=="ok"){
                        alert("打卡成功");
                    }
                    if (data=="no"){
                        alert("今天已经打过卡了");
                    }
                });
                return false;
            });
            $("#down").click(function () {
                var name = $("#name").text();
                var url = "/emp/down";
                var args = {"name":name};
                $.post(url,args,function (data) {
                    if (data=="ok"){
                        alert("打卡成功");
                    }
                    if (data=="no"){
                        alert("今天已经打过卡了");
                    }
                });
                return false;
            })
        })
    </script>
</head>
<body>
    当前用户：<span id="name">${sessionScope.user.name}</span>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a id="up" href="#">上班签到</a></li>
                <li><a id="down" href="#">下班签到</a></li>
                <li><a href="/emp/card?name=${sessionScope.user.name}">我的考勤</a></li>
                <li><a href="/emp/ud?name=${sessionScope.user.name}">我的奖惩</a></li>
                <li><a href="/emp/salary?name=${sessionScope.user.name}">我的薪资</a></li>
                <li><a href="/emp/own?name=${sessionScope.user.name}">个人信息</a></li>
                <li><a href="/emp/see">部门职位</a></li>
                <li><a href="/login.jsp">退出</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>
