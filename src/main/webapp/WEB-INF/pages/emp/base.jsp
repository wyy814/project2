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
                alert("打卡成功");
            });
            $("#down").click(function () {
                alert("打卡成功");
            })
        })
    </script>
</head>
<body>
    <span>当前用户：${sessionScope.user.name}</span>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a id="up" href="/emp/up">上班签到</a></li>
                <li><a id="down" href="/emp/down">下班签到</a></li>
                <li><a href="/emp/card">我的考勤</a></li>
                <li><a href="/emp/ud">我的奖惩</a></li>
                <li><a href="/emp/salary">我的薪资</a></li>
                <li><a href="/emp/own">个人信息</a></li>
                <li><a href="/emp/see">部门职位</a></li>
                <li><a href="/login.jsp">退出</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>
